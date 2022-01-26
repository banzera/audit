class OrderDepositsDatatable < Effective::Datatable

  collection do
    scope = OrderDeposit.all
  end

  filters do
    scope :all, default: true
    # scope :outstanding
  end

  datatable do
    order :odepositdate, :desc

    col :odepositid
    col :odepositdate, as: :date
    col :odepositbatch

    actions_col
  end
end
