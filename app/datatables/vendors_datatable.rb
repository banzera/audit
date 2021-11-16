class VendorsDatatable < Effective::Datatable

  collection do
    scope = Vendor.all
  end

  datatable do
    order :vendorid, :desc

    col :vendorid, visible: false
    col('Name') {|v| v.vendorname }
    col('Abbreviation') {|v| v.vendorabbr}

    actions_col
  end
end
