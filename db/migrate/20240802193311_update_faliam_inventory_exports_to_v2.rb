class UpdateFaliamInventoryExportsToV2 < ActiveRecord::Migration[6.1]
  def up
    drop_view :faliam_inventory_exports
    replace_view :faliam_inventory_exports, version: 2
  end

  def down
    drop_view :faliam_inventory_exports
    replace_view :faliam_inventory_exports, version: 1
  end

end
