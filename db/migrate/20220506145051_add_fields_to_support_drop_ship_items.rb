class AddFieldsToSupportDropShipItems < ActiveRecord::Migration[6.1]
  def change
    change_table :tblpreorder do |t|
      t.integer :splrid, index: true
      t.foreign_key :tblsupplier, column: :splrid, primary_key: :splrid

      t.decimal :ds_tax_amount
    end
  end
end
