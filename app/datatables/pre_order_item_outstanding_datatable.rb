class PreOrderItemOutstandingDatatable < Effective::Datatable

  collection do
    scope = PreOrderItemOutstanding.order(custbusinessname: :asc, preorderdate: :asc, manf: :asc)
  end

  filters do
    # zscope :outstanding, default: true
  end

  datatable do
    order :custbusinessname

    col :custbusinessname, action: :show
    col :preorderdate, as: :date
    col :skuid2,          visible: true, label: "SKU" do |item|
      if item.skuid2.positive?
        link_to item.skuid2, sku_path(item.skuid2), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end
    end
    col :pre_order, action: :show
    col :manf
    col :itemno
    col :orderaupriceper,  as: :currency
    col :orderpriceper2,   as: :currency
    col :orderpricetotal2, as: :currency
    col :orderquant2, label: 'Quant'
    col :avail # {}"Avail" do |item| item.txtDC + txtDue] end
    col :dccurquant, label: 'DC'
    col :totaldue,   label: 'InTrans'

    # actions_col
  end
end
