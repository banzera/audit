class OrderPaymentItemsDatatable < Effective::Datatable

  collection do
    op    = attributes[:order_payment]
    scope = op.present? ? op.items : OrderPaymentItem.none
  end

  filters do
    scope :all, default: true
    # scope :outstanding
  end

  datatable do
    order :opmtsitemsid, :asc

    col :opmtsitemsid, visible: false
    col :order_item

    col :opmtstotal, as: :currency
    col :deposit

    actions_col
  end
end
