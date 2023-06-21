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

  scope :in_range,     -> (date_range) { where(podate: date_range) }

  scope :current, -> { in_range(monthrange(0)) }
  scope :prev1,   -> { in_range(monthrange(1)) }
  scope :prev2,   -> { in_range(monthrange(2)) }
  scope :prev3,   -> { in_range(monthrange(3)) }
  scope :prev4,   -> { in_range(monthrange(4)) }
  scope :prev5,   -> { in_range(monthrange(5)) }

  def self.monthrange(x)
    day = Date.today - x.month
    range = day.beginning_of_month..day.end_of_month
  end

  validates_presence_of :supplier1,
                        :supplier2,
                        :posplrorderno,
                        :podate,
                        :invoice_tax,
                        :invoice_sh,
                        :invoice_subtotal,
                        :invoice_total

  has_batch_number :pobatch, date: :podate, attrs: 'supplier1.splrname' do |po|
    PurchaseOrder
      .select(:poid, :pobatch)
      .where("DATE(podate) = ?", self.podate)
      .where(supplier1: self.supplier1)
      .order(:pobatch)
      .last&.pobatch
  end

  def self.ship_types
    select(:poshiptype).distinct.pluck(:poshiptype).compact
  end

  def self.paid_methods
    select(:pomethodpaid).distinct.pluck(:pomethodpaid).compact
  end

  def missing_invoice_values?
    [
      invoice_tax,
      invoice_sh,
      invoice_subtotal,
      invoice_total,
    ].map(&:blank?).any?
  end

  def unfullfilled?
    items.unfulfilled.any?
  end

  def to_s
    "Purchase Order #{poid}"
  end

  VOID_POID = 0
  VOID = begin
    find_or_create_by(poid: VOID_POID) do |po|
      po.podate           = 20.years.ago
      po.supplier1        = Supplier::NONE
      po.supplier2        = Supplier::NONE
      po.posplrorderno    = 'VOIDPO'
      po.invoice_tax      = 0.0
      po.invoice_sh       = 0.0
      po.invoice_subtotal = 0.0
      po.invoice_total    = 0.0
    end.tap do |po|
      po.update(pobatch: 'VOIDPO')
      po.readonly!
    end
  end

  private

end
