class UpdateMonthlyInvoiceReportToV6 < ActiveRecord::Migration[6.1]
  def up
    drop_view :monthly_invoice_report
    replace_view :monthly_invoice_report, version: 6
  end

  def down
    drop_view :monthly_invoice_report
    create_view :monthly_invoice_report, version: 5
  end
end
