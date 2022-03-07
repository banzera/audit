class SkuIssuesDatatable < Effective::Datatable

  collection do
    scope = if attributes[:search]
      Sku.search attributes[:search]
    else
      Sku.has_issue
    end
  end

  datatable do
    order :skuid, :desc

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

    actions_col only: [:resolve_issue]
  end
end
