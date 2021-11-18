class VendorsDatatable < Effective::Datatable

  collection do
    scope = Vendor.all
  end

  datatable do
    order :vendorid, :desc

    col :vendorid, visible: false
    col :vendorname
    col :vendorabbr

    actions_col
  end
end
