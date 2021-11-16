class OrdersDatatable < Effective::Datatable

  collection do
    scope = Order.includes(:customer).all
  end

  datatable do
    order :orderdate, :desc

    col :orderid, visible: false
    col :orderdate
    col :orderbatch
    col :customer
    # col :ordertaxrate
    # col :orderdelivereddate
    # col :orderdeliverdfrom
    # col :orderdeliveredto
    # col :ordershipmethod
    # col :orderreceipthl
    # col :orderdateinvoiced
    # col :orderdatepaid
    # col :orderpaymentmethod
    # col :orderpaymentamount
    # col :ordernotes
    # col :orderccdate
    # col :preordercompletedate
    # col :orderconfirmdate

    actions_col
  end
end
