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
    col :sku, search: false
    col :purchase_order
    col :orderquant
    col :orderpriceper, visible: false
    col :orderpricetotal, visible: false
    col :ordertaxrate, visible: false
    col :ordertaxtotal, visible: false
    col :orderdeliverycosttotal, visible: false
    col :orderfeestotal, visible: false
    col :ordergrandtotal, visible: false
    col :orderitemsdelivereddate, visible: false
    col :orderdeliveredquant
    # col :orderretailtotal

    actions_col
  end
end
