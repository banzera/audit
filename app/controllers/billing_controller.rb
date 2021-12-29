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

end
