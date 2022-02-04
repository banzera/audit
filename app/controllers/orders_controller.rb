class OrdersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  before_action :load_customer, except: [:outstanding, :index]
  before_action :set_page_title, if: -> { /_preview/.match? action_name }
  before_action :set_pdf_options, only: [:confirmation, :invoice, :pick_list, :ship_list]
  before_action :set_report_date

  button :confirmation,      false
  button :invoice,           false
  button :ship_list,         false
  button :shipping_label,    false
  button :invoice_preview,      'Invoice', if: -> { resource.orderdelivereddate.present? }
  button :ship_list_preview,    'Ship List'
  button :confirmation_preview, false #, 'Confirmation'
  button :shipping_label_preview, 'Shipping Label'
  button :pick_list,            'Pick List'
  button :edit, 'Edit', default: true

  on     :mark_as_billed, redirect: -> { billing_due_path }
  button :mark_as_billed, 'Bill Credit Card', unless: -> { resource.billed? },
                                              class: 'btn btn-primary',
                                              data: {
                                                method: :post,
                                                confirm: "Really mark @resource as billed?"
                                              }

  def invoice
    @pdf_options['orientation']  = 'Portrait'
  end

  def invoice_preview
    render 'preview', locals: { extra_resource_actions: [:mark_as_billed] }
  end

  def ship_list_preview
    render 'preview'
  end

  def confirmation_preview
    render 'preview'
  end

  def shipping_label
    @page_title = "Shipping Label for #{@order}"
    render layout: 'pdf/dymo-30256'
  end

  def pick_list
    @pick_list = @order.pick_list_items.order(:orderitemsid)
  end

  def outstanding
    @page_title = "Outstanding Orders Report"

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

  def set_report_date
    @report_date = begin
      Date.parse params[:report_date]
    rescue TypeError
      Date.today
    end
  end

  def set_pdf_options
    @pdf_options['orientation']  = 'Landscape'
    @pdf_options['margin-left']  = '0.3in'
    @pdf_options['margin-right'] = '0.3in'
  end

  def set_page_title
    @page_title = "#{action_name.titleize} for Order: #{@order}"
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
