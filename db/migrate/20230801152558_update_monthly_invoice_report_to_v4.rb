class UpdateMonthlyInvoiceReportToV4 < ActiveRecord::Migration[6.1]
  def change
    replace_view :monthly_invoice_report, version: 4, revert_to_version: 3
  end
end
