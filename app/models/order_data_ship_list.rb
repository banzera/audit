class OrderDataShipList < ApplicationRecord
  self.table_name  = 'qryorderdatashippinglist2'
  self.primary_key = 'orderid'

  belongs_to :order, foreign_key: :orderid

end
