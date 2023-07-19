class UpdateMonthlyInvoiceReportToV3 < ActiveRecord::Migration[6.1]
  def change
    replace_view :monthly_invoice_report, version: 3, revert_to_version: 2
  end
end
