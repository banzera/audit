class CustomerItemsDatatable < Effective::Datatable

  collection do
    customer = attributes[:customer]
    scope    = if customer.present?
      PreOrderItem.for_customer(customer)
    else
      PreOrderItem.none
    end

    if filters[:start_date]
      scope = scope.where("orderdate >= ?", filters[:start_date] )
    end

    if filters[:end_date]
      scope = scope.where("orderdate <= ?", filters[:end_date] )
    end

    scope.joins(:sku1).includes(:sku1)
  end

  filters do
    # scope :all, default: true
    # scope :recent, default: true
    # scope :outstanding

    filter :start_date, Date.today - 6.months, required: true
    filter :end_date, Date.today, parse: -> (term) {
      term.present? ? Date.parse(term).end_of_day : Date.today
    }, as: :date
  end

  datatable do
    length :all

    # order :preorderitemsid, :asc

    col :preorderitemsid, visible: false
    col :orderdate, as: :date, label: 'Date', search: false
    col :skuid1,           label: 'SKU 1', search: false, visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :orderpricetotal1, label: 'Price', search: false, as: :currency
    col :skuid2,           label: 'SKU 2', search: false, visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :orderpricetotal2, label: 'Price', search: false, as: :currency
    col :poid,             label: 'POID',  search: false, visible: true, partial: 'application/dt/po',      sort: false
    col :code do |item| item.code&.preordercode end
    col :orderquant1,      label: 'Qty 1', search: false
    col :orderquant2,      label: 'Qty 2', search: false
    col :sku_class do |item| item.sku1.sku_class&.skuclassdesc end
    col 'sku1.manf'
    col 'sku1.itemno',     label: "Item No"
    col 'sku1.skudesc',    label: "Description"
    # col :preordernotes, visible: false
    # col :preorderurgent, partial: 'application/dt/boolean', label: 'Urgent', sort: false
  end
end
