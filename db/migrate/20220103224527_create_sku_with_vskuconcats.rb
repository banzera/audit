class CreateSkuWithVskuconcats < ActiveRecord::Migration[6.1]
  def change
    create_view :sku_with_vskuconcats
  end
end
