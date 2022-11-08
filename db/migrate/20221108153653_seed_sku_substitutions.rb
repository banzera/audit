class SeedSkuSubstitutions < ActiveRecord::Migration[6.1]
  def up
    ActiveRecord::Base.connection.execute <<~SQL
      INSERT INTO sku_substitutions(
        house_brand_id,
        sub_id,
        created_at,
        updated_at
      )
      SELECT DISTINCT
        skuid,
        house_brand_for_id,
        now(),
        now()
       FROM tblsku
      WHERE house_brand_for_id NOTNULL
    SQL

    ActiveRecord::Base.connection.execute <<~SQL
      INSERT INTO sku_substitutions(
        house_brand_id,
        sub_id,
        created_at,
        updated_at
      )
      SELECT DISTINCT
        sku.skuid,
        poi.skuid2,
        now(),
        now()
       FROM tblpreorderitems poi
       JOIN tblsku sku ON sku.house_brand_for_id = poi.skuid1
      WHERE poi.skuid1 != poi.skuid2
        AND poi.skuid2 != 0;
    SQL
  end

  def down
    ActiveRecord::Base.connection.execute <<~SQL
      TRUNCATE sku_substitutions
    SQL
  end
end
