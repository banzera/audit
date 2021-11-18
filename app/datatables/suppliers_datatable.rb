class SuppliersDatatable < Effective::Datatable

  collection do
    scope = Supplier.all
  end

  datatable do
    order :splrid, :desc

    col :splrid, visible: false
    col :splrname
    col :splrfirst
    col :splrlast
    col :splrbusinessname
    col :splraddress, visible: false, search: false
    col :splrcity,    visible: false, search: false
    col :splrst,      visible: false, search: { as: :select, collection: Supplier.select(:splrst).order(:splrst).distinct.pluck(:splrst) }
    col :splrzip,     visible: false, search: false
    col :splrwebsite, visible: false, search: false
    col :splremail,   visible: false, search: false
    col :splrphone,   visible: false, search: false
    col :splrfax,     visible: false, search: false
    col :splrprimarycontact1, visible: false, search: false
    col :splrphone1,  visible: false, search: false
    col :splremail1,  visible: false, search: false
    col :splrprimarycontact2, visible: false, search: false
    col :splrphone2, visible: false, search: false
    col :splremail2, visible: false, search: false
    col :splrtaxid,  visible: false, search: false
    col :splrqbo,    visible: false, search: false
    col :splrnotes,  visible: false, search: false

    actions_col
  end
end
