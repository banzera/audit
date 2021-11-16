class PurchaseOrderItemsDatatable < Effective::Datatable

  collection do
    po    = attributes[:po]
    scope = po.present? ? po.items : PurchaseOrderItem.all
  end

  datatable do
    order :poitemsid, :asc

    col :poitemsid, search: false, visible: false
    col :sku, search: false
    col :poorderquant, search: false
    col(:poorderprice, search: false) {|poi| number_to_currency(poi.poorderprice) }
    # col :poordertax, search: false
    # col :poordershipping, search: false
    # col :poorderfees, search: false
    # col :poordertotal, search: false
    # col :poorderpriceper, search: false
    # col :poordertaxper, search: false
    # col :poordershippingper, search: false
    # col :poorderfeesper, search: false
    # col :poordertotalper, search: false
    col :poorderrcvddate, search: false
    col :poorderrcvdquant, search: false
    # col :poorderexpiration, search: false
    # col :poorderrebatedeadline, search: false
    # col :poorderrebatesubmitted, search: false
    # col :poorderrebate, search: false
    # col :poorderrebatenotes, search: false

  end
end
