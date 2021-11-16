class PurchaseOrderItem < ApplicationRecord
  self.table_name  = 'tblpurchaseorderitems'
  self.primary_key = 'poitemsid'

  belongs_to :purchase_order, class_name: 'PurchaseOrder', foreign_key: :poid, inverse_of: :items
  belongs_to :sku,            class_name: 'Sku',           foreign_key: :skuid

  scope :unfulfilled, -> { where('poorderquant != poorderrcvdquant') }

  def to_s
    "#{sku} (#{poorderquant})"
  end
end
