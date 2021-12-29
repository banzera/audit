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
    col :orderdelivereddate,   visible: false, as: :date
    col :orderdeliverdfrom,    visible: false
    col :orderdeliveredto,     visible: false
    col :ordershipmethod,      visible: false
    col :orderreceipthl,       visible: false
    col :orderdateinvoiced,    visible: false, as: :date
    col :orderdatepaid,        visible: false, as: :date
    col :orderpaymentmethod,   visible: false
    col :orderpaymentamount,   visible: false
    col :ordernotes,           visible: false
    col :orderccdate,          visible: false, as: :date
    col :preordercompletedate, visible: false, as: :date
    col :orderconfirmdate,     visible: false, as: :date

    actions_col
  end
end
