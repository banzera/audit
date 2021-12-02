class OrdersDatatable < Effective::Datatable

  collection do
    scope = Order.includes(:customer).all
  end

  filters do
    scope :all, default: true
    scope :outstanding
  end

  datatable do
    order :orderdate, :desc

    col :orderid, visible: false
    col :orderdate, as: :date
    col :orderbatch
    col :customer, action: :show
    col :ordertaxrate,         visible: false
    col :orderdelivereddate,   visible: false
    col :orderdeliverdfrom,    visible: false
    col :orderdeliveredto,     visible: false
    col :ordershipmethod,      visible: false
    col :orderreceipthl,       visible: false
    col :orderdateinvoiced,    visible: false
    col :orderdatepaid,        visible: false
    col :orderpaymentmethod,   visible: false
    col :orderpaymentamount,   visible: false
    col :ordernotes,           visible: false
    col :orderccdate,          visible: false
    col :preordercompletedate, visible: false
    col :orderconfirmdate,     visible: false

    actions_col
  end
end
