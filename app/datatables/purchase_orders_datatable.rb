class PurchaseOrdersDatatable < Effective::Datatable

  collection do
    scope = PurchaseOrder.all
  end

  filters do
    scope :all
    scope :outstanding
  end

  datatable do
    order :podate, :desc

    col :podate, search: false, as: :date
    col :pobatch, label: PurchaseOrder.human_attribute_name(:pobatch)
    col :supplier1, search: false, label: PurchaseOrder.human_attribute_name(:supplier1)
    col :supplier2, search: false
    col :poshipdate, search: false, as: :date
    col :poshiptype, search: { as: :select, collection: PurchaseOrder.ship_types }
    # col :potrackingno, search: false
    # col :porcvdby, search: false
    # col :podatepaid, search: false, as: :date
    col :pomethodpaid, search: { as: :select, collection: PurchaseOrder.paid_methods }
    # col :popaymentno, search: false
    col :poamountpaid, search: false
    # col :ponotes, search: false
    col :posplrorderno, search: false
    col :pochecksentdate, search: false, as: :date

    actions_col
  end
end
