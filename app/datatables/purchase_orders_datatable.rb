class PurchaseOrdersDatatable < Effective::Datatable

  collection do
    scope = PurchaseOrder.all
    if filters[:sku].present?
      scope = scope.with_sku_fuzzy filters[:sku]
    end

    scope
  end

  filters do
    scope :all
    scope :outstanding

    filter :sku, '', placeholder: "Fuzzy SKU Search"
  end

  datatable do
    order :poid, :desc

    col :poid
    col :podate,          visible: true,  search: false, as: :date
    col :pobatch,         visible: false
    col :supplier1,       visible: true,  search: false, action: :show
    col :supplier2,       visible: true,  search: false, action: :show
    col :poshipdate,      visible: true,  search: false, as: :date
    col :poshiptype,      visible: false, search: { as: :select, collection: PurchaseOrder.ship_types }
    col :potrackingno,    visible: false, search: false
    col :porcvdby,        visible: false, search: false
    col :podatepaid,      visible: false, search: false, as: :date
    col :pomethodpaid,    visible: false, search: { as: :select, collection: PurchaseOrder.paid_methods }
    col :popaymentno,     visible: false, search: false
    col :poamountpaid,    visible: true,  search: false, as: :currency
    col :ponotes,         visible: false, search: false
    col :posplrorderno,   visible: true,  search: { as: :string, fuzzy: true }
    col :pochecksentdate, visible: false, search: false, as: :date

    actions_col only: [:show]
  end
end
