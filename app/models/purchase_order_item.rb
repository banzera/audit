class PurchaseOrderItem < ApplicationRecord
  self.table_name  = 'tblpurchaseorderitems'
  self.primary_key = 'poitemsid'

  include HasParent
  parent :purchase_order

  belongs_to :purchase_order, class_name: 'PurchaseOrder', foreign_key: :poid, inverse_of: :items
  belongs_to :sku,            class_name: 'Sku',           foreign_key: :skuid

  has_many :supplier_payments, class_name: 'SupplierPaymentItem', foreign_key: :poitemsid

  scope :unfulfilled, -> { where('poorderquant != poorderrcvdquant') }

  scope :with_sku_fuzzy, -> (term) {
    skus  = Sku.search(term).pluck(:skuid)
    where(skuid: skus)
  }

  validates_presence_of :poorderquant, :poorderrcvdquant
  validates_uniqueness_of :sku, scope: [:poid], message: 'is already on this PO'

  validates_presence_of :poorderexpiration, if: :expiring_sku

  def self.most_recent_for_sku(skuid)
    self.where(skuid: skuid)
        .includes(:purchase_order)
        .joins(:purchase_order)
        .maximum(:podate)
  end

  def receive!
    update(poorderrcvddate: Time.current) and sku.resolve_issue!
  end

  def has_payment?
    supplier_payments.any?
  end

  def unfulfilled?
    poorderquant != poorderrcvdquant
  end

  accepts_nested_attributes_for :sku, update_only: true

  def expiring_sku
    sku.has_expiration_date?
  end

  def diff_quant
    self.poorderquant - self.poorderrcvdquant
  end

  def to_s
    "PO Item: #{sku} (#{poorderquant})"
  end
end
