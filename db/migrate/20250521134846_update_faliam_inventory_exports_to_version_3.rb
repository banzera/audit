class UpdateFaliamInventoryExportsToVersion3 < ActiveRecord::Migration[6.1]
  def change
    update_view :faliam_inventory_exports, version: 3, revert_to_version: 2
  end
end
