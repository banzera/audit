class PurchaseOrderItemsDatatable < Effective::Datatable

  collection do
    po    = attributes[:po]
    scope = po.present? ? po.items : PurchaseOrderItem.all

    if filters[:sku].present?
      scope = scope.with_sku_fuzzy filters[:sku]
    end

    scope
  end

  filters do
    scope :all, default: true
    scope :unfulfilled

    filter :sku, '', placeholder: "Fuzzy SKU Search"
  end

  datatable do
    length :all

    order :poid, :desc

    col :poitemsid,    visible: false, search: false
    col :poid,         visible: attributes[:po].blank?, partial: 'application/dt/po', label: "PO"
    col :sku,          visible: true, partial: 'application/dt/sku', label: "SKU"
    col :description do |poi| poi.sku.skudesc end
    # col :poorderprice,     search: false, label: "Order Price", as: :currency
    col 'Item Number' do |poi| poi.sku.itemno end
    col :poorderquant,     search: false, label: "Order Qty"
    col :poorderrcvdquant, search: false, label: "Received Qty"
    col :diff_quant,       search: false, label: "Awaiting"
    # col :poordertax, search: false
    # col :poordershipping, search: false
    # col :poorderfees, search: false
    # col :poordertotal, search: false
    # col :poorderpriceper, search: false
    # col :poordertaxper, search: false
    # col :poordershippingper, search: false
    # col :poorderfeesper, search: false
    # col :poordertotalper, search: false
    # col :poorderrcvddate, search: false
    # col :poorderexpiration, search: false
    # col :poorderrebatedeadline, search: false
    # col :poorderrebatesubmitted, search: false
    # col :poorderrebate, search: false
    # col :poorderrebatenotes, search: false

    # TODO: no actions when viewing through a PO
    actions_col partial: 'purchase_order_items/dt/actions'
  end
end
