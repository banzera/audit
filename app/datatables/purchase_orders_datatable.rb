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

    scope :prev5, label: scope_label(5)
    scope :prev4, label: scope_label(4)
    scope :prev3, label: scope_label(3)
    scope :prev2, label: scope_label(2)
    scope :prev1, label: scope_label(1)
    scope :current, label: scope_label(0), default: true

    filter :sku, '', placeholder: "Fuzzy SKU Search"
  end

  def scope_label(x)
    I18n.l(Date.today - x.months, format: :month)
  end

  datatable do
    order :poid, :desc

    col :poid
    col :podate,          visible: true,  search: false, as: :date
    col :pobatch,         visible: false
    col :supplier1,       visible: true,  search: { collection: Supplier.all },  action: :show
    col :supplier2,       visible: true,  search: { collection: Supplier.all },  action: :show
    col :poshipdate,      visible: true,  search: false, as: :date
    col :poshiptype,      visible: false, search: { as: :select, collection: PurchaseOrder.ship_types }
    col :potrackingno,    visible: false, search: false
    col :porcvdby,        visible: false, search: false
    col :podatepaid,      visible: false, search: false, as: :date
    col :pomethodpaid,    visible: false, search: { as: :select, collection: PurchaseOrder.paid_methods }
    col :popaymentno,     visible: false, search: false
    col :poamountpaid,    visible: false, search: false, as: :currency
    col :ponotes,         visible: false, search: false
    col :posplrorderno,   visible: true,  search: { as: :string, fuzzy: true }
    col :pochecksentdate, visible: false, search: false, as: :date
    col :invoice_tax,      visible: false, search: false, as: :currency
    col :invoice_sh,       visible: false, search: false, as: :currency
    col :invoice_subtotal, visible: false, search: false, as: :currency
    col :invoice_total,    visible: true,  search: false, as: :currency

    actions_col only: [:show]

    aggregate :total do |values, column|
      if column[:name] == :invoice_total
        number_to_currency(values.compact.sum)
      end
    end
  end
end
