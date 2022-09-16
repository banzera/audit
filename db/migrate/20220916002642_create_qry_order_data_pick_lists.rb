class CreateQryOrderDataPickLists < ActiveRecord::Migration[6.1]
  def change
    update_view :qry_order_data_pick_list, version: 1
  end
end
