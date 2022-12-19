class PreOrdersDatatable < Effective::Datatable

  collection do
    PreOrder.includes(:customer)
            .includes(:vendor)
            .includes(:order)
  end

  filters do
    scope :all, default: true

    scope :awaiting_analysis
    # scope :confirmed
    scope :unconfirmed
    # scope :checked
    scope :not_checked
  end

  datatable do
    order :preorderid, :desc

    col :preorderid, label: 'ID'
    col :preorderdate, as: :date, search: false
    col :preorderbatch
    col :customer, action: :show
    col :vendor, visible: false
    col :preorderanalysisdate, search: false, as: :date, label: "Analysis"
    col :confirmationdate,     search: false, as: :date, label: "Confirmed"
    col :preordercheck,        search: false, as: :date, label: "Checked"
    col :ordercreatedate,      search: false, as: :date, label: "Order Date"
    col :order

    actions_col only: :show
  end
end
