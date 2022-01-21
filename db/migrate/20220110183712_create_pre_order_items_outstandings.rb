class CreatePreOrderItemsOutstandings < ActiveRecord::Migration[6.1]
  def change
    create_view :pre_order_items_outstandings
  end
end
