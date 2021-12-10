class OrderDataPickList < ApplicationRecord
  self.table_name  = 'qry_order_data_pick_list'
  self.primary_key = 'orderid'

  belongs_to :order, foreign_key: :orderid
end
