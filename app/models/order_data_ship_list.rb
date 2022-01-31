class OrderDataShipList < ApplicationRecord
  self.table_name  = 'qryorderdatashippinglist'
  self.primary_key = 'orderid'

  belongs_to :order, foreign_key: :orderid

end
