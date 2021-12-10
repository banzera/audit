class OrderItem < ApplicationRecord
  self.table_name  = 'tblorderitems'
  self.primary_key = 'orderitemsid'

  belongs_to :order,          foreign_key: :orderid
  belongs_to :purchase_order, foreign_key: :poid

  scope :unfulfilled, -> { where('orderquant != orderdeliveredquant') }

  def unfulfilled?
    orderquant != orderdeliveredquant
  end


end
