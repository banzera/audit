class AddQboInvoiceToOrder < ActiveRecord::Migration[6.1]
  def change
    add_column :tblorder, :qbo_invoice_number, :string
  end
end
