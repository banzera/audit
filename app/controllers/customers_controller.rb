class CustomersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  button :sku_infos, false

  def order_history
    @datatable = OrdersDatatable.new(customer: @customer)
    @datatable.effective_resource = Effective::Resource.new(Order)

    render :other_action
  end

  def sku_history
    @datatable = CustomerItemsDatatable.new(customer: @customer)
    @datatable.effective_resource = Effective::Resource.new(PreOrderItem)

    render :other_action
  end

  def billing
    @page_title = "#{@customer} Billing Dashboard"
    @datatable  = MarginReportDatatable.new(customer: @customer)
    @invoice    = MonthlyInvoiceReport.for_customer(@customer)

    scope = params[:scope] || :current

    @invoice_amounts = if @invoice.respond_to?(scope)
      @invoice.public_send(scope)
    else
      @invoice.current
    end.first

    respond_to do |format|
      format.html {}
      format.csv {
        invoice = InvoiceService::Invoice.new(@invoice_amounts, 1001)

        send_data invoice.to_csv, filename: invoice.filename
      }
    end
  end

  def sku_infos
    @infos = @customer.sku_infos

    case params[:scope]
    when 'never' then @infos = @infos.never
    when 'always' then @infos = @infos.always
    end

    render json: @infos.to_json
  end

  def permitted_params
    params.require(:customer).permit([
      :custname,
      :custbusinessname,
      :custfirst, :custlast, :custsal, :custtitle,
      :custaddress, :custcity, :custst, :custzip,
      :custphone, :custfax, :custemail,
      :custprimarycontact1, :custphone1, :custphonetype1, :custemail1,
      :custprimarycontact2, :custphone2, :custphonetype2, :custemail2,
      :custtaxrate,
      :custnotes,
      :custdatecreated,
      :custdatemodified,
      :custbillingbusinessname, :custbillingfirst, :custbillinglast,
      :custbillingsal, :custbillingtitle, :custbillingaddress,
      :custbillingcity, :custbillingst, :custbillingzip,
      :custbillingphone, :custbillingfax, :custbillingemail,
      :custbillingsame,
      :custqbo,
      :custccauth,
      :custcclast4,
      :custtaxjurisid,
      :lastrewarddate,
      :custhsacct,
      :discontinued,
      :custtyfirstname, :custtylastname, :custtyaddress,
      :custtycity, :custtyst, :custtyzip, :custtyphone,
      :custtyemail,
      :billing_mode,
      :subscription_amount,
    ])
  end
  alias_method :customer_params, :permitted_params
end
