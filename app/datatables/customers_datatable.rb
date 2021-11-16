class CustomersDatatable < Effective::Datatable

  collection do
    scope = Customer.all
  end

  datatable do

    col :custname
    # col :custbusinessname
    # col :custfirst
    # col :custlast
    # col :custsal
    # col :custtitle
    # col :custaddress
    # col :custcity
    col :custst
    # col :custzip
    # col :custphone
    # col :custfax
    # col :custemail
    # col :custprimarycontact1
    # col :custphone1
    # col :custphonetype1
    # col :custemail1
    # col :custprimarycontact2
    # col :custphone2
    # col :custphonetype2
    # col :custemail2
    # col :custtaxrate
    # col :custnotes
    # col :custdatecreated
    # col :custdatemodified
    # col :custbillingbusinessname
    # col :custbillingfirst
    # col :custbillinglast
    # col :custbillingsal
    # col :custbillingtitle
    # col :custbillingaddress
    # col :custbillingcity
    # col :custbillingst
    # col :custbillingzip
    # col :custbillingphone
    # col :custbillingfax
    # col :custbillingemail
    # col :custbillingsame
    # col :custqbo
    # col :custccauth
    # col :custcclast4
    # col :custtaxjurisid
    # col :lastrewarddate
    # col :custhsacct
    # col :discontinued
    # col :custtyfirstname
    # col :custtylastname
    # col :custtyaddress
    # col :custtycity
    # col :custtyst
    # col :custtyzip
    # col :custtyphone
    # col :custtyemail


    actions_col
  end
end
