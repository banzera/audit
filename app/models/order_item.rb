class OrderItem < ApplicationRecord
  self.table_name  = 'tblorderitems'
  self.primary_key = 'orderitemsid'

  belongs_to :order,          foreign_key: :orderid
  belongs_to :purchase_order, foreign_key: :poid
  belongs_to :sku,            foreign_key: :skuid
  belongs_to :customer,       foreign_key: :custid

  scope :unfulfilled, -> { where('orderquant != orderdeliveredquant') }

  def unfulfilled?
    orderquant != orderdeliveredquant
  end

  def to_s
    "#{sku} (#{orderquant})"
  end

end