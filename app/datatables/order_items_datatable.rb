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
    col :orderquant,                             label: "Quantity"
    col :orderpriceper,          visible: false
    col :orderpricetotal,        visible: false
    col :ordertaxrate,           visible: false
    col :ordertaxtotal,          visible: false
    col :orderdeliverycosttotal, visible: false
    col :orderfeestotal,         visible: false
    col :ordergrandtotal,        visible: false
    col :orderdeliveredquant,                    label: "Delivered"
    col :orderitemsdelivereddate, visible: true, as: :date, label: "Delivered Date"
    # col :orderretailtotal

    actions_col
  end
end
