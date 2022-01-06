class InventoryScanOperationsDatatable < Effective::Datatable

  collection do
    scope = InventoryScanOperation.all
  end

  datatable do
    order :id, :desc

    length 50

    col :id
    col :user_id, visible: false
    col :sku
    col :dc_loc
    col :scanned_at
    col :received_at

    actions_col
  end
end
