class DeprecatePoInvoiceNontaxAndFees < ActiveRecord::Migration[6.1]
  def change
    sql = <<~SQL
      update tblpurchaseorder set invoice_subtotal=invoice_nontax where invoice_subtotal = '0.0';
    SQL

    PurchaseOrder.connection.execute sql

    remove_column :tblpurchaseorder, :invoice_nontax
    remove_column :tblpurchaseorder, :invoice_fees
  end
end
