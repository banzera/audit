class OrderItemsDatatable < Effective::Datatable

  collection do
    order = attributes[:order]
    scope = if order.present?
      order.items
    else
      OrderItem.joins(:order).where("orderdate > ?", 100.days.ago)
    end

    scope.joins(:sku).includes(:sku)
  end

  filters do
    scope :all, default: true
  end

  datatable do
    length 50

    order 'sku.dcloc'

    col 'sku.dcloc', visible: false
    col :orderitemsid, search: false, visible: false
    col :sku,  partial: 'application/dt/sku',    label: "SKU"
    col :poid, partial: 'application/dt/po',     label: "PO"
    col 'sku.manf'
    col 'sku.itemno',  label: "Item No"
    col 'sku.skudesc', label: "Description"
    col :orderpriceper,          visible: false, as: :currency, label: 'Price Per'
    col :orderpricetotal,        visible: false, as: :currency, label: 'Sub-total'
    col :ordertaxrate,           visible: false
    col :ordertaxtotal,          visible: false, as: :currency, label: 'Tax'
    col :orderdeliverycosttotal, visible: false, as: :currency, label: 'Delivery Cost'
    col :orderfeestotal,         visible: false, as: :currency, label: 'Fees'
    col :ordergrandtotal,        visible: false, as: :currency, label: 'Total'
    col :orderquant,                             label: "Qty"
    col :orderdeliveredquant,                    label: "Delivered"
    col :diff_quant,              search: false, label: "Due"

    col :orderitemsdelivereddate, visible: true, as: :date, col_class: 'col-actions', label: "Delivered Date" do |i|
      if i.orderitemsdelivereddate.present?
        i.orderitemsdelivereddate.to_date.to_s(:american)
      else
        link_to mark_as_delivered_order_item_path(i),
          class: "btn btn-sm btn-outline-secondary",
          data: {confirm: '', method: :post, remote: true } do
          fa_icon 'box-open', text: "Set Ship Date!"
        end
      end
    end

    actions_col partial: 'order_items/dt/actions'

    # aggregate :total
    aggregate :total do |values, column|
      if column[:name] == :orderitemsdelivereddate
        fa_icon 'arrow-left', text: 'Total Outstanding Items'
      elsif column[:name] == :diff_quant
        values.sum
      end
    end
  end
end
