class OrdersDatatable < Effective::Datatable

  collection do
    customer = attributes[:customer]

    scope = Order.includes(:customer).all

    if customer.present?
      scope = scope.where(custid: customer.id)
    end

    scope
  end

  filters do
    scope :all, default: true
    scope :outstanding
    scope :awaiting_confirmation
  end

  datatable do
    order :orderid, :desc

    col :orderid
    col :orderdate, as: :date
    col :orderbatch
    unless attributes[:customer].present?
      col :customer, action: :show
    end
    col :ordertaxrate,         visible: false
    col :orderdelivereddate,   visible: attributes[:customer].present?, as: :date
    col :orderdeliverdfrom,    visible: false
    col :orderdeliveredto,     visible: false
    col :ordershipmethod,      visible: false
    col :orderreceipthl,       visible: false
    col :orderdateinvoiced,    visible: false, as: :date
    col :orderdatepaid,        visible: attributes[:customer].present?, as: :date
    col :orderpaymentmethod,   visible: false
    col :orderpaymentamount,   visible: false
    col :ordernotes,           visible: false
    col :orderccdate,          visible: false, as: :date
    col :preordercompletedate, visible: false, as: :date
    col :orderconfirmdate,     visible: false, as: :date

    actions_col
  end
end
