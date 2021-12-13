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

    col :orderitemsid
    col :sku
    col :poid
    col :orderid
    col :orderquant
    col :orderpriceper
    col :orderpricetotal
    col :ordertaxrate
    col :ordertaxtotal
    col :orderdeliverycosttotal
    col :orderfeestotal
    col :ordergrandtotal
    col :orderitemsdelivereddate
    col :orderdeliveredquant
    col :orderretailtotal

    actions_col only: [:split]
  end
end
