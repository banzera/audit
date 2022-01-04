class CreateSkuExports < ActiveRecord::Migration[6.1]
  def change
    create_view :sku_export
  end
end
