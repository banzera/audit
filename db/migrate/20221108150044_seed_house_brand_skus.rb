class SeedHouseBrandSkus < ActiveRecord::Migration[6.1]
  def up
    add_column :tblsku, :house_brand_for_id, :bigint

    ActiveRecord::Base.connection.execute <<~SQL
      INSERT INTO tblsku(
        sku,
        itemno,
        manf,
        skudesc,
        unitweight,
        categoryid,
        skuminunits,
        skuminunitstype,
        skuclassid,
        skumaxtemp,
        skumintemp,
        house_brand_for_id
      )
      SELECT DISTINCT
        'AUHB' || sku.sku,
        'AUHB' || sku.itemno,
        'AUHB',
        sku.skudesc,
        sku.unitweight,
        sku.categoryid,
        sku.skuminunits,
        sku.skuminunitstype,
        sku.skuclassid,
        sku.skumaxtemp,
        sku.skumintemp,
        sku.skuid
       FROM tblpreorderitems poi
       JOIN tblsku sku on sku.skuid = poi.skuid1
      WHERE poi.skuid1 != poi.skuid2
        AND poi.skuid2 NOTNULL;
    SQL
  end

  def down
    drop_column :tblsku, :house_brand_for_id, :bigint

    ActiveRecord::Base.connection.execute <<~SQL
      DELETE FROM tblsku
      WHERE manf = 'AUHB'
    SQL
  end
end
