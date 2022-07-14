class TaxJurisdictionsDatatable < Effective::Datatable

  collection do
    scope = TaxJurisdiction.all
  end

  datatable do
    col :jurisdictioncode
    col :jurisdictionname
    col :rateeffdate, as: :date
    col :taxrate, as: :percent

    actions_col
  end
end
