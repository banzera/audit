class PreOrderItemsDatatable < Effective::Datatable

  collection do
    pre_order = attributes[:pre_order]
    scope     = pre_order.present? ? pre_order.items : PreOrderItem.none
    scope.order(preorderitemsid: :asc)
  end

  filters do
    scope :recent, default: true
    scope :outstanding
  end

  datatable do
    length 100

    order :preorderitemsid, :asc

    col :preorderitemsid, visible: false
    col :orderdate, as: :date, label: 'Date'
    col :skuid1,          label: 'SKU 1', visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :skuid2,          label: 'SKU 2', visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :poid,            label: 'POID',  visible: true, partial: 'application/dt/po',      sort: false
    col :code do |item| item.code&.preordercode end
    col :orderquant1,      label: 'Qty 1'
    col :orderquant2,      label: 'Qty 2'
    col :orderpriceper1,   as: :currency, sort: false, label: 'Price @ 1'
    col :orderpriceper2,   as: :currency, sort: false, label: 'Price @ 2'
    col :orderpricetotal1, as: :currency, sort: false, label: 'Price Total 1'
    col :orderpricetotal2, as: :currency, sort: false, label: 'Price Total 2'
    col :orderaupriceper,  as: :currency, sort: false, label: 'AU Price @'
    col :preordernotes, visible: false
    col :preorderurgent, partial: 'application/dt/boolean', label: 'Urgent', sort: false

    # TODO: no actions when viewing through a PreOrder
    actions_col actions_partial: 'pre_order_items/dt/actions'
  end
end
