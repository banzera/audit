class OrderPaymentsDatatable < Effective::Datatable

  collection do
    scope = OrderPayment.all
  end

  filters do
    scope :all, default: true
    # scope :outstanding
  end

  datatable do
    order :opmtsdate, :desc

    col :opmtsid
    col :opmtsdate, as: :date
    col :opmtsbatch

    actions_col
  end
end
