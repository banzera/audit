class SkuHistoryDatatable < Effective::Datatable

  collection do
    scope = if attributes[:skuid]
      SkuPoHistory.where(skuid: attributes[:skuid])
    else
      SkuPoHistory.none
    end
  end

  filters do
    scope :available, default: true
    scope :all
  end

  datatable do
    order :poid, :desc

    col :poid, partial: 'application/dt/po', label: "PO"
    col :podate, label: 'Date', as: :date
    col :poorderexpiration, label: 'Expiration', as: :date
    col :in_dc, label: 'In DC'
    col :available
    col :skuid,    visible: false
    col :splrid2,  visible: false
    col :splrname, visible: false
    col :podiff,   visible: false
    col :poorderquant,     label: 'Qty'
    col :poorderrcvdquant, label: 'Received'
    col :poorderpriceper,  label: 'Price Per',      as: :currency
    col :priceeachlesstax, label: 'Price Less Tax', as: :currency
    col :sumoforderquant,  label: 'Sum of Order Qty'
    col :sumoforderdeliveredquant, label: 'Sum of Delivered Qty'

    actions_col partial: 'sku_po_histories/dt/actions'
  end
end
