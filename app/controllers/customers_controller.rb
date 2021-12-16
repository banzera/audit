class CustomersController < ApplicationController
  include DefaultCrudController

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
    ])
  end

end
