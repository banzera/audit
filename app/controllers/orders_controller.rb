class OrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  def pick_list
    @customer  = @order.customer
    @pick_list = @order.pick_list_items.order(:orderitemsid)

    @pdf_options['orientation']  = 'Landscape'
    @pdf_options['margin-left']  = '0.3in'
    @pdf_options['margin-right'] = '0.3in'

    @page_title = "Pick List: #{@order.orderbatch}"
  end

  def outstanding
    @datatable = OrderItemOutstandingDatatable.new
    @items     = OrderItemOutstanding.known_location
                                     .order(:orderid, :manf, :skudesc)
    @items_a = @items.to_a

    @customers = OrderItemOutstanding.known_location.limit(100)
                                     .distinct(:custid)
                                     .order(:custname)
                                     .pluck(:custid, :custbusinessname, :custname)
  end

  def permitted_params
    params.require(:order).permit([
      :orderdate,
      :orderbatch,
      :custid,
      :ordertaxrate,
      :orderdelivereddate,
      :orderdeliverdfrom,
      :orderdeliveredto,
      :ordershipmethod,
      :orderreceipthl,
      :orderdateinvoiced,
      :orderdatepaid,
      :orderpaymentmethod,
      :orderpaymentamount,
      :ordernotes,
      :orderccdate,
      :preordercompletedate,
      :orderconfirmdate,
    ])
  end

end
