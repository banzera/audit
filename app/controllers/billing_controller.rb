class BillingController < ApplicationController

  def due
    @datatable = OrderCcBillDueDatatable.new
    @dt_opts = {
      buttons:    false,
      pagination: false,
      entries:    true,
    }
    render :index
  end

  def report
    @datatable = MonthlyInvoiceDatatable.new
    @dt_opts = {
      # buttons:    false,
      pagination: false,
      entries:    false,
    }
  end

  def export
    InvoiceService.export(params[:scope]) do |zipfile|
      send_data zipfile.data, filename: 'invoices.zip'
    end
  end
end
