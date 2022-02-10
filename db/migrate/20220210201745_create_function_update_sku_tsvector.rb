class CreateFunctionUpdateSkuTsvector < ActiveRecord::Migration[6.1]
  def change
    create_function :update_sku_tsvector
  end
end
