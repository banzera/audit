class CreateFaliamInventoryExports < ActiveRecord::Migration[6.1]
  def change
    create_view :faliam_inventory_exports
  end
end
