class SkuCustInfosDatatable < Effective::Datatable

  collection do
    scope = if attributes[:customer]
      SkuCustInfo.where(custid: attributes[:customer])
    else
      SkuCustInfo.all
    end
  end

  filters do
    scope :all, default: true
    scope :always
    scope :never
  end

  datatable do
    col :skucustinfoid, visible: false
    col :sku
    col :skuonly
    col :skuonlydate, as: :date
    col :skunever
    col :skuneverdate, as: :date
    col :skucustnotes, visible: false

    actions_col only: [:show]
  end
end
