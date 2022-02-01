class OrderItemsDatatable < Effective::Datatable

  collection do
    order = attributes[:order]
    scope = order.present? ? order.items : OrderItem.all
  end

  filters do
    scope :all, default: true
  end

  datatable do
    order :orderitemsid, :desc

    col :orderitemsid, search: false, visible: false
    col :sku,  partial: 'application/dt/sku',    label: "SKU"
    col :poid, partial: 'application/dt/po',     label: "PO"
    col :orderpriceper,          visible: true, as: :currency, label: 'Price Per'
    col :orderpricetotal,        visible: true, as: :currency, label: 'Sub-total'
    col :ordertaxrate,           visible: false
    col :ordertaxtotal,          visible: true, as: :currency, label: 'Tax'
    col :orderdeliverycosttotal, visible: false, as: :currency, label: 'Delivery Cost'
    col :orderfeestotal,         visible: false, as: :currency, label: 'Fees'
    col :ordergrandtotal,        visible: true, as: :currency, label: 'Total'
    col :orderquant,                             label: "Qty"
    col :orderdeliveredquant,                    label: "Delivered"
    col :diff_quant,              search: false, label: "Due"
    col :orderitemsdelivereddate, visible: true, as: :date, label: "Delivered Date"

    # add button to delivery date column
    # col :orderretailtotal

    actions_col partial: 'order_items/dt/actions'
    # actions_col
  end
end
