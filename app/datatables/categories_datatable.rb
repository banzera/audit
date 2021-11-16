class CategoriesDatatable < Effective::Datatable

  collection do
    scope = Category.all
  end

  datatable do
    col :categoryid,   search: false, visible: false
    col :categorydesc, search: false

    actions_col
  end
end
