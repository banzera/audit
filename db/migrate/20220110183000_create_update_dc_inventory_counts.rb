class CreateUpdateDcInventoryCounts < ActiveRecord::Migration[6.1]
  def change
    create_view :update_dc_inventory_counts
  end
end
