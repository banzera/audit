class OrderCcBillDueDatatable < Effective::Datatable

  collection do
    scope = Order.includes(:items)

    if filters[:cc_billed_on].present?
      scope = scope.billed_on(filters[:cc_billed_on].to_date)
    end

    scope
  end

  filters do
    scope :cc_bill_due, label: "CC Billing Due", default: true
    scope :all
    # scope :billed_today
    filter :cc_billed_on, nil, as: :date, placeholder: "Credit Card Billed On"
    # filter :cc_billed_on, nil,
    #         as: :select,
    #         collection: [
    #             ['Today',      Date.today],
    #             ['Yesterday',  1.days.ago],
    #             ['2 days ago', 2.days.ago],
    #             ['3 days ago', 3.days.ago],
    #             ['4 days ago', 4.days.ago]] #, label: false, include_blank: false
    # filter :end_date, nil, parse: -> (term) { Time.zone.local(term).end_of_day }
  end

  datatable do
    order :orderdate, :desc

    col :customer, action: :show
    col :orderid,              visible: true do |o| link_to o.orderid, o, title: 'Show', class: 'btn btn-sm btn-outline-secondary' end
    col :orderbatch
    col :orderdate,            visible: true, as: :date, search: false
    col :ordertaxrate,         visible: false
    col :orderdelivereddate,   visible: true, as: :date
    col :invoice_amount, search: false do |o| number_to_currency(o.orderpricetotal) end
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

    actions_col only: [:invoice_preview]
  end
end
