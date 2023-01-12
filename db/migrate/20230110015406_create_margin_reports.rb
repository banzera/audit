class CreateMarginReports < ActiveRecord::Migration[6.1]
  def change
    create_view :margin_report
    create_view :monthly_invoice_report
  end
end
