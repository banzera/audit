class CustomersDatatable < Effective::Datatable

  collection do
    scope = Customer.all
  end

  datatable do
    col :custname
    col :custbusinessname,         visible: false
    col :custfirst
    col :custlast
    col :custsal,                 visible: false
    col :custtitle,               visible: false
    col :custaddress,             visible: false
    col :custcity,                visible: false
    col :custst,                  visible: false
    col :custzip,                 visible: false
    col :custphone,               visible: false
    col :custfax,                 visible: false
    col :custemail,               visible: false
    col :custprimarycontact1,     visible: false
    col :custphone1,              visible: false
    col :custphonetype1,          visible: false
    col :custemail1,              visible: false
    col :custprimarycontact2,     visible: false
    col :custphone2,              visible: false
    col :custphonetype2,          visible: false
    col :custemail2,              visible: false
    col :custtaxrate,             visible: false
    col :custnotes,               visible: false
    col :custdatecreated,         visible: false
    col :custdatemodified,        visible: false
    col :custbillingbusinessname, visible: false
    col :custbillingfirst,        visible: false
    col :custbillinglast,         visible: false
    col :custbillingsal,          visible: false
    col :custbillingtitle,        visible: false
    col :custbillingaddress,      visible: false
    col :custbillingcity,         visible: false
    col :custbillingst,           visible: false
    col :custbillingzip,          visible: false
    col :custbillingphone,        visible: false
    col :custbillingfax,          visible: false
    col :custbillingemail,        visible: false
    col :custbillingsame,         visible: false
    col :custqbo,                 visible: false
    col :custccauth,              visible: false
    col :custcclast4,             visible: false
    col :custtaxjurisid,          visible: false
    col :lastrewarddate,          visible: false
    col :custhsacct,              visible: false
    col :discontinued,            visible: false
    col :custtyfirstname,         visible: false
    col :custtylastname,          visible: false
    col :custtyaddress,           visible: false
    col :custtycity,              visible: false
    col :custtyst,                visible: false
    col :custtyzip,               visible: false
    col :custtyphone,             visible: false
    col :custtyemail,             visible: false

    actions_col
  end
end
