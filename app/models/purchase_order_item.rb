class PurchaseOrderItem < ApplicationRecord
  self.table_name  = 'tblpurchaseorderitems'
  self.primary_key = 'poitemsid'

  belongs_to :purchase_order, class_name: 'PurchaseOrder', foreign_key: :poid, inverse_of: :items
  belongs_to :sku,            class_name: 'Sku',           foreign_key: :skuid

  scope :unfulfilled, -> { where('poorderquant != poorderrcvdquant') }

  validates_presence_of :poorderquant, :poorderrcvdquant

  attr_accessor :invoice_subtotal, :invoice_total,
                :invoice_tax, :invoice_nontax,
                :invoice_sh, :invoice_fees


  def unfulfilled?
    poorderquant != poorderrcvdquant
  end

  accepts_nested_attributes_for :sku, update_only: true

  def diff_quant
    self.poorderquant - self.poorderrcvdquant
  end

  def to_s
    "#{sku} (#{poorderquant})"
  end
end
