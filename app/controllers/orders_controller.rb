class OrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource
  before_action :load_customer, only: [:invoice, :invoice_preview, :pick_list]
  before_action :set_page_title
  before_action :set_pdf_options, only: [:ship_list]

  button :invoice, false
  button :ship_list, false
  on     :mark_as_billed, redirect: -> { billing_due_path }
  button :mark_as_billed, 'Bill Credit Card', unless: -> { resource.billed? },
                                              class: 'btn btn-primary',
                                              data: {
                                                method: :post,
                                                confirm: "Really mark @resource as billed?"
                                              }

  def invoice
    @pdf_options['orientation']  = 'Landscape'
    @pdf_options['margin-left']  = '0.25in'
    @pdf_options['margin-right'] = '0.25in'

    @page_title = "Invoice: #{@order}"
  end

  def invoice_preview
    @page_title = "Invoice Preview: #{@order}"
  def ship_list
    @ship_list = @order.ship_list_items.order(:orderitemsid)
  end

  def pick_list
    @pick_list = @order.pick_list_items.order(:orderitemsid)
  def ship_list_preview
    render 'preview'
  end

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

  private

  def set_pdf_options
    @pdf_options['orientation']  = 'Landscape'
    @pdf_options['margin-left']  = '0.3in'
    @pdf_options['margin-right'] = '0.3in'
  end

  def set_page_title
    @page_title = "#{action_name.titleize}: #{@order}"
  end

  def load_customer
    @customer  = @order.customer
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
