class CustomerItemsDatatable < Effective::Datatable

  collection do
    customer = attributes[:customer]
    scope    = if customer.present?
      PreOrderItem.for_customer(customer)
    else
      PreOrderItem.none
    end

    scope.joins(:sku1)
         .includes(:sku1)
         .order(preorderitemsid: :asc)
  end

  # filters do
  #   # scope :recent, default: true
  #   # scope :outstanding
  #   scope :all, default: true
  # end

  datatable do
    length 100

    order :preorderitemsid, :asc

    col :preorderitemsid, visible: false
    col :orderdate, as: :date, label: 'Date'
    col :skuid1,          label: 'SKU 1', visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :orderpricetotal1,label: 'Price', as: :currency
    col :skuid2,          label: 'SKU 2', visible: true, partial: 'pre_order_items/dt/sku', sort: false
    col :orderpricetotal2,label: 'Price', as: :currency
    col :poid,            label: 'POID',  visible: true, partial: 'application/dt/po',      sort: false
    col :code do |item| item.code&.preordercode end
    col :orderquant1,      label: 'Qty 1'
    col :orderquant2,      label: 'Qty 2'
    col 'sku1.manf'
    col 'sku1.itemno',      label: "Item No"
    col 'sku1.skudesc',     label: "Description"
    # col :preordernotes, visible: false
    # col :preorderurgent, partial: 'application/dt/boolean', label: 'Urgent', sort: false
  end
end
