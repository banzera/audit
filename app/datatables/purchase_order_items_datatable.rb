class PurchaseOrderItemsDatatable < Effective::Datatable

  collection do
    po    = attributes[:po]
    scope = po.present? ? po.items : PurchaseOrderItem.all
  end

  filters do
    scope :all, default: true
    scope :unfulfilled
  end

  datatable do
    order :poitemsid, :asc

    col :poitemsid, search: false, visible: false
    col :sku, search: false
    col :description do |poi| poi.sku.skudesc end
    col :poorderquant, search: false
    col(:poorderprice, search: false) {|poi| number_to_currency(poi.poorderprice) }
    col :diff_quant, search: false, col_class: 'disabled color-palette'
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
    col :poorderrcvdquant, search: false
    # col :poorderexpiration, search: false
    # col :poorderrebatedeadline, search: false
    # col :poorderrebatesubmitted, search: false
    # col :poorderrebate, search: false
    # col :poorderrebatenotes, search: false

    # TODO: no actions when viewing through a PO
    actions_col only: [:receive]
  end
end
