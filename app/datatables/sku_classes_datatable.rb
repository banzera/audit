class SkuClassesDatatable < Effective::Datatable

  collection do
    scope = SkuClass.all
  end

  datatable do
    col :skuclassid
    col :skuclassdesc

    actions_col
  end
end
