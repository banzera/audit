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
    col :businessname

    actions_col
  end
end
