class CreateMonthlyInvoiceReports < ActiveRecord::Migration[6.1]
  def change
    replace_view :monthly_invoice_report, version: 2, revert_to_version: 1
  end
end
