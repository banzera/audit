class AddInventoryScanOperations < ActiveRecord::Migration[6.1]
  def change

    create_table :inventory_scan_operations do |t|
      t.integer  :user_id
      t.integer  :sku_id
      t.string   :dc_loc
      t.datetime :scanned_at
      t.datetime :received_at
      t.jsonb    :properties

      t.timestamps
    end

  end
end
