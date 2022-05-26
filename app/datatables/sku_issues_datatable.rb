class SkuIssuesDatatable < Effective::Datatable

  collection do
    Sku.needing_attention
  end

  datatable do
    length 25
    order :skuid, :desc

    col :skuid, partial: 'skus/dt/sku'
    col :sku,              visible: false
    col :manf
    col :itemno
    col :skudesc,          search: { as: :string, fuzzy: true }
    col :unitweight,       visible: false
    col :category,         visible: false
    col :skuminunits,      visible: false
    col :skuminunitstype,  visible: false, search: { as: :select, collection: Sku.select(:skuminunitstype).distinct.pluck(:skuminunitstype) }
    col :dcloc,            visible: true
    col :skuminpercs,      visible: false
    col :skuhighprice,     visible: false, as: :currency
    col :skuhighpricevno,  visible: false
    col :skuhighpricedate, visible: false
    col :sku_class
    col :skumaxtemp,       visible: false
    col :skumintemp,       visible: false
    col :skunotes,         visible: false

    actions_col only: [:resolve_issue], resolve_issue: { if: -> { resource.has_issue? } }
  end
end
