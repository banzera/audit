class CreateQryOrderItemsOutstandings < ActiveRecord::Migration[6.1]
  def change
    replace_view :qry_order_items_outstanding, version: 1
  end
end
