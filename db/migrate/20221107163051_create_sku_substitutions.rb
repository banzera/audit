class CreateSkuSubstitutions < ActiveRecord::Migration[6.1]
  def change
    create_table :sku_substitutions do |t|

      t.references :house_brand
      t.foreign_key :tblsku, column: :house_brand_id, primary_key: :skuid

      t.references :sub
      t.foreign_key :tblsku, column: :sub_id, primary_key: :skuid

      t.timestamps
    end
  end
end
