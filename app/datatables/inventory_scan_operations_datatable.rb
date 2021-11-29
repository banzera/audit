class InventoryScanOperationsDatatable < Effective::Datatable

  collection do
    scope = InventoryScanOperation.all
  end

  datatable do
    col :id
    col :user_id
    col :sku
    col :dc_loc
    col :scanned_at
    col :received_at

    actions_col
  end
end
