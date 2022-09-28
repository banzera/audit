class AddHasExpirationToSku < ActiveRecord::Migration[6.1]
  def up
    add_column :tblsku, :has_expiration_date, :boolean, default: false

    execute <<~SQL
       UPDATE tblsku SET has_expiration_date = 't' WHERE skuid IN (
          SELECT skuid
            FROM tblpurchaseorderitems
           WHERE poorderexpiration notnull
        )
    SQL
  end

  def down
    remove_column :tblsku, :has_expiration_date
  end
end
