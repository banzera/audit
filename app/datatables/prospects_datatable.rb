class ProspectsDatatable < Effective::Datatable

  collection do
    scope = Prospect.all
  end

  datatable do
    col :office_name
    col :clinic_type

    col :assigned_to

    col :status

    actions_col
  end
end
