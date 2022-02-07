class SkusDatatable < Effective::Datatable

  collection do
    scope = if attributes[:search]
      Sku.search attributes[:search]
    else
      Sku.all
    end
  end

  filters do
    scope :all, default: true
    scope :in_transit
    scope :in_dc, label: "In DC"
  end

  datatable do
    col :skuid
    col :sku,              visible: false
    col :manf
    col :itemno
    col :skudesc,          search: { as: :string, fuzzy: true }
    col :unitweight,       visible: false
    col :category,         visible: false
    col :skuminunits,      visible: false
    col :skuminunitstype,  visible: false, search: { as: :select, collection: Sku.select(:skuminunitstype).distinct.pluck(:skuminunitstype) }
    col :dcloc,            visible: false
    col :skuminpercs,      visible: false
    col :skuhighprice,     visible: false, as: :currency
    col :skuhighpricevno,  visible: false
    col :skuhighpricedate, visible: false
    col :sku_class
    col :skumaxtemp,       visible: false
    col :skumintemp,       visible: false
    col :skunotes,         visible: false

    actions_col only: [:show]
  end
end
