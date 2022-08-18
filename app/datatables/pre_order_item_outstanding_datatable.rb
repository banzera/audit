class PreOrderItemOutstandingDatatable < Effective::Datatable

  collection do
    PreOrderItemOutstanding.all
  end

  filters do
    # zscope :outstanding, default: true
  end

  datatable do
    order :preorderitemsid

    col :preorderitemsid, label: "ID" do |resource|
      link_to resource.preorderitemsid,
              edit_pre_order_pre_order_item_path(resource.preorderid, resource.preorderitemsid),
              class: 'btn btn-sm btn-outline-secondary',
              target: '_preorderitem'
    end

    col :custbusinessname, label: 'Customer', action: :show
    col :pre_order, action: :show
    col :preorderdate, label: 'Date', as: :date
    col :skuid2,          visible: true, label: "SKU" do |item|
      if item.skuid2.positive?
        link_to item.skuid2, sku_path(item.skuid2), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end
    end
    col :purchase_order, label: 'Assigned PO', partial: 'application/dt/po'
    col :last_po_date,   label: 'Most Recent PO for SKU' do |item|
      poid = item.sku.most_recent_po&.poid || 0
      if poid.positive?
        link_to poid, purchase_order_path(poid), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end
    end

    col :orderquant2, label: 'Quant'
    col :avail
    col :dccurquant, label: 'DC'
    col :totaldue,   label: 'InTrans'
  end
end
