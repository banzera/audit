class PurchaseOrder < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblpurchaseorder'
  self.primary_key = 'poid'

  belongs_to :supplier1, class_name: 'Supplier', foreign_key: :splrid
  belongs_to :supplier2, class_name: 'Supplier', foreign_key: :splrid2

  has_many :items, class_name: 'PurchaseOrderItem', foreign_key: :poid

  scope :outstanding, -> { where(poid: PurchaseOrderItem.unfulfilled.pluck(:poid)) }

  scope :for_sku_id, -> (skuid) {
    items = PurchaseOrderItem.where(skuid: skuid).pluck(:poid)
    where(poid: items)
  }

  scope :with_sku_fuzzy, -> (term) {
    skus  = Sku.search(term).pluck(:skuid)
    items = PurchaseOrderItem.where(skuid: skus).pluck(:poid)
    where(poid: items)
  }

  validates_presence_of :supplier1,
                        :supplier2,
                        :posplrorderno,
                        :podate

  has_batch_number :pobatch, date: :podate, attrs: 'supplier1.splrname' do |po|
    PurchaseOrder
      .where("DATE(podate) = ?", self.podate)
      .where(supplier1: self.supplier1)
      .count || 0
  end

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
    "Purchase Order #{poid}"
  end

  private

end
