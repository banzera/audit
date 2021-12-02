class PreOrdersDatatable < Effective::Datatable

  collection do
    scope = PreOrder.includes(:customer).includes(:vendor).includes(:order)
  end

  filters do
    scope :analyzed
    scope :confirmed
    scope :checked
  end

  datatable do
    order :preorderdate, :desc

    col :preorderdate, as: :date, search: false
    col :preorderbatch
    col :customer, action: :show
    col :vendor
    col :order

    actions_col
  end
end
