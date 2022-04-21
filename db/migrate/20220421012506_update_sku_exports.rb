class UpdateSkuExports < ActiveRecord::Migration[6.1]
  def change
    update_view :sku_export, version: 2
  end
end
