class PurchaseOrderItem < ApplicationRecord
  self.table_name  = 'tblpurchaseorderitems'
  self.primary_key = 'poitemsid'

  include HasParent
  parent :purchase_order

  belongs_to :purchase_order, class_name: 'PurchaseOrder', foreign_key: :poid, inverse_of: :items
  belongs_to :sku,            class_name: 'Sku',           foreign_key: :skuid

  scope :unfulfilled, -> { where('poorderquant != poorderrcvdquant') }

  scope :with_sku_fuzzy, -> (term) {
    skus  = Sku.search(term).pluck(:skuid)
    where(skuid: skus)
  }

  validates_presence_of :poorderquant, :poorderrcvdquant

  def receive!
    self.update(poorderrcvddate: Time.current)
  end

  def unfulfilled?
    poorderquant != poorderrcvdquant
  end

  accepts_nested_attributes_for :sku, update_only: true

  def diff_quant
    self.poorderquant - self.poorderrcvdquant
  end

  def to_s
    "PO Item: #{sku} (#{poorderquant})"
  end
end
