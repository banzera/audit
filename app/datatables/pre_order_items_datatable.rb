class PreOrderItemsDatatable < Effective::Datatable

  collection do
    pre_order = attributes[:pre_order]
    scope     = pre_order.present? ? pre_order.items : PreOrderItem.none
  end

  filters do
    scope :all, default: true
  end

  datatable do
    length :all

    order :preorderitemsid, :asc

    col :preorderitemsid, visible: false
    col :preorderid,      visible: false
    col :skuid1,          visible: true, partial: 'pre_order_items/dt/sku'
    col :skuid2,          visible: true, partial: 'pre_order_items/dt/sku'

    col :poid,            visible: true do |item|
      if item.poid&.positive?
        link_to item.purchase_order, purchase_order_path(item.poid), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end
    end
    col :orderdate, as: :date

    col :code do |item| item.code&.preordercode end

    col :orderquant1
    col :orderquant2
    col :orderpriceper1,   as: :currency
    col :orderpriceper2,   as: :currency
    col :orderpricetotal1, as: :currency
    col :orderpricetotal2, as: :currency
    col :orderaupriceper,  as: :currency
    col :preordernotes, visible: false
    col :preorderurgent, partial: 'dt_boolean'

    # TODO: no actions when viewing through a PreOrder
    actions_col actions_partial: 'pre_order_items/dt/actions'
  end
end
