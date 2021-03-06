class SkuLookupDatatable < Effective::Datatable

  collection do
    scope = if attributes[:search]
      Sku.search attributes[:search]
    else
      Sku.all
    end
  end

  datatable do
    col :sku
    col :manf
    col :itemno
    col :skudesc
    col :unitweight,       visible: false
    col :category
    col :sku_class
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

    actions_col only: :receive
  end
end
