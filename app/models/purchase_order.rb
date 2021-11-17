class PurchaseOrder < ApplicationRecord
  self.table_name  = 'tblpurchaseorder'
  self.primary_key = 'poid'

  belongs_to :supplier1, class_name: 'Supplier', foreign_key: :splrid
  belongs_to :supplier2, class_name: 'Supplier', foreign_key: :splrid2

  has_many :items, class_name: 'PurchaseOrderItem', foreign_key: :poid

  scope :outstanding, -> { where(poid: PurchaseOrderItem.unfulfilled.pluck(:poid)) }
  # scope :outstanding, -> { items.where(poitemsid: PurchaseOrderItem.unfulfilled.pluck(:poitemsid) }

  def self.ship_types
    select(:poshiptype).distinct.pluck(:poshiptype).compact
  end

  def self.paid_methods
    select(:pomethodpaid).distinct.pluck(:pomethodpaid).compact
  end

  def unfullfilled?
    items.unfulfilled.any?
  end

  def to_s
    pobatch
  end

end
