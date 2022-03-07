class OrderItem < ApplicationRecord
  self.table_name  = 'tblorderitems'
  self.primary_key = 'orderitemsid'

  include HasParent
  parent :order

  belongs_to :order,          foreign_key: :orderid
  belongs_to :purchase_order, foreign_key: :poid
  belongs_to :sku,            foreign_key: :skuid

  scope :unfulfilled, -> { where('orderquant != orderdeliveredquant') }

  validates :orderquant,          numericality: { greater_than_or_equal_to: 0 }
  validates :orderdeliveredquant, numericality: { less_than_or_equal_to: :orderquant,
                                                  message: "must be less than or equal to Quantity" }

  attr_accessor :popriceper

  def unfulfilled?
    orderquant != orderdeliveredquant
  end

  def diff_quant
    self.orderquant - self.orderdeliveredquant
  end

  def confirm_picked!
    unless self.attribute_changed?(:orderitemsdelivereddate)
      self.orderitemsdelivereddate = Time.current.to_date
    end
    self.orderdeliveredquant = self.orderquant

    save
  end

  def mark_as_delivered!
    unless self.attribute_changed?(:orderitemsdelivereddate)
      self.orderitemsdelivereddate = Time.current.to_date
    end

    save
  end

  def mark_has_issue!
    sku.update(has_issue: true)
  end

  def split!
    # self will have the user's attributes set
    # need to duplicate item with these attributes,
    # reset the object back to its original state,
    # and then calc pricing for dup and original item

    dup = self.dup

    self.restore_attributes
    self.decrement(:orderquant, dup.orderquant)

    self.update_pricing_for_split
    dup.update_pricing_for_split

    self.save and dup.save
  end

  def update_pricing_for_split
    self.orderpricetotal = (self.orderquant * self.orderpriceper).round(2)
    self.ordertaxtotal   = (self.orderpricetotal * self.ordertaxrate).round(2)
    self.ordergrandtotal = [self.orderpricetotal, self.ordertaxtotal].sum
  end

  def duplicate_for_split
    dup = self.dup
    self.poid                    = nil
    self.orderquant              = self.orderquant - self.orderdeliveredquant
    self.orderdeliveredquant     = 0
    self.orderitemsdelivereddate = nil
    dup
  end

  def to_s
    "Item for #{order} (SKU: #{skuid}, PO: #{poid}, Qty: #{orderquant})"
  end

end
