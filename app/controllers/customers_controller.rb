class CustomersController < ApplicationController
  include DefaultCrudController

  load_and_authorize_resource

  button :sku_infos, false

  def billing
    @page_title = "#{@customer} Billing Dashboard"
    @datatable = MarginReportDatatable.new(customer: @customer)

    @invoice = MonthlyInvoiceReport.for_customer(@customer)

    scope = params[:scope] || :current

    @invoice_amounts = if @invoice.respond_to?(scope)
      @invoice.public_send(scope)
    else
      @invoice.current
    end.first

    respond_to do |format|
      format.html {}
      format.csv {
        filename = [
          @customer.custname,
          @invoice_amounts.month.to_s(:number),
        ].join('_') + ".csv"

        send_data InvoiceService::Invoice.new(@invoice_amounts, 0).to_csv, filename: filename
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
    ])
  end
  alias_method :customer_params, :permitted_params
end
