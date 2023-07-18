class PreOrderItemsDatatable < Effective::Datatable

  collection do
    pre_order = attributes[:pre_order]
    scope     = pre_order.present? ? pre_order.items : PreOrderItem.none

    scope.joins(:sku1)
         .includes(:sku1)
         .order(preorderitemsid: :asc)
  end

  filters do
    scope :all, default: true
    scope :recent
    scope :outstanding
  end

  datatable do
    length :all

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
    col :preordernotes, visible: false
    col :preorderurgent, partial: 'application/dt/boolean', label: 'Urgent', sort: false

    # TODO: no actions when viewing through a PreOrder
    actions_col actions_partial: 'pre_order_items/dt/actions'

    aggregate :total do |values, column|
      if [:skuid1, :skuid2].include? column[:name]
        fa_icon 'arrow-right', right: true, text: 'Total'
      elsif [:orderpricetotal1, :orderpricetotal2].include? column[:name]
        number_to_currency(values.compact.sum)
      end
    end
  end
end
