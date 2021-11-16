class SkusDatatable < Effective::Datatable

  collection do
    scope = Sku.all
  end

  datatable do
    col :sku
    col :manf
    col :itemno

    actions_col
  end
end
