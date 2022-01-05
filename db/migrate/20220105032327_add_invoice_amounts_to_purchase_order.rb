class AddInvoiceAmountsToPurchaseOrder < ActiveRecord::Migration[6.1]
  def change
    change_table :tblpurchaseorder do |t|
      t.decimal :invoice_nontax
      t.decimal :invoice_tax
      t.decimal :invoice_sh
      t.decimal :invoice_fees
      t.decimal :invoice_subtotal
      t.decimal :invoice_total
    end
  end
end
