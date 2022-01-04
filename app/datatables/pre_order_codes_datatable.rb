class PreOrderCodesDatatable < Effective::Datatable

  collection do
    scope = PreOrderCode.all
  end

  datatable do
    col :preordercodeid,   search: false, visible: false
    col :preordercode,     search: false
    col :preordercodedesc, search: false

    actions_col
  end
end
