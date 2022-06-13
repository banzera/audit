class ProspectsDatatable < Effective::Datatable

  collection do
    scope = Prospect.all
  end

  datatable do
    col :office_name
    col :doctors_name
    col :clinic_type, visible: false
    col :city do |p| p.primary_address&.city end
    col :assigned_to
    col :status, search: { as: :select, collection: Prospect::STATUS }, col_class: 'text-center' do |p|
      fa_icon 'circle lg', style: "color:#{p.status}"
    end

    col :updated_at, as: :date

    actions_col
  end
end
