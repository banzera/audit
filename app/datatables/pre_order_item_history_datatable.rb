class PreOrderItemHistoryDatatable < Effective::Datatable

  collection do
    scope = if attributes[:skuid]
      PreOrderItemHistory.where(skuid: attributes[:skuid])
    else
      PreOrderItemHistory.none
    end
  end

  datatable do
    order :orderdate, :desc

    length 10

    col :orderdate,  label: 'Date', as: :date
    col :orderquant, label: 'Quant'
    col :orderpriceper, label: 'Price Per'
    col :customer
    col :vendor
    col :supplier

    # actions_col partial: 'sku_po_histories/dt/actions'
  end
end
