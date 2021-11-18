class SkusDatatable < Effective::Datatable

  collection do
    scope = Sku.all
  end

  datatable do
    col :skuid
    col :sku
    col :manf
    col :itemno
    col :skudesc,          visible: false
    col :unitweight,       visible: false
    col :category
    col :skuminunits,      visible: false
    col :skuminunitstype,  visible: false, search: { as: :select, collection: Sku.select(:skuminunitstype).distinct.pluck(:skuminunitstype) }
    col :dcloc,            visible: false
    col :skuminpercs,      visible: false
    col :skuhighprice,     visible: false, as: :currency
    col :skuhighpricevno,  visible: false
    col :skuhighpricedate, visible: false
    col :skuclassid,       visible: false
    col :skumaxtemp,       visible: false
    col :skumintemp,       visible: false
    col :skunotes,         visible: false

    actions_col
  end
end
