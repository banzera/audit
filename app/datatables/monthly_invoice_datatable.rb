class MonthlyInvoiceDatatable < Effective::Datatable

  collection do
    customer = attributes[:customer]
    scope    = customer.present? ? MonthlyInvoiceReport.for_customer(customer) : MonthlyInvoiceReport.all

  end

  filters do
    scope :prev5, label: scope_label(5)
    scope :prev4, label: scope_label(4)
    scope :prev3, label: scope_label(3)
    scope :prev2, label: scope_label(2)
    scope :prev1, label: scope_label(1)
    scope :current, label: scope_label(0), default: true
  end

  def scope_label(x)
    I18n.l(Date.today - x.months, format: :month)
  end

  def multi_value_row(*values)
    view.content_tag(:div, values.extract_options!) do
      values.map {|v| view.content_tag(:span, v)}.join('<br>'.html_safe).html_safe
    end
  end

  datatable do
    length :all
    order :custid, :asc

    col :custid, visible: false
    col :customer, action: :show
    col :custname, label: "Customer Name"
    col :preorders, sort: false do |v|
      v.preorders.map do |id|
        link_to id, pre_order_path(id), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end.join("&nbsp;")
    end
    col :orders, sort: false do |v|
      v.orders.map do |id|
        link_to id, order_path(id), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end.join("&nbsp;")
    end

    col :current_total,    label: 'Market Total',    as: :currency
    col :accelerate_total, label: 'AU Total',        as: :currency
    col :gross_savings,    label: 'Savings',         as: :currency
    col :tier1_qual,       label: 'Tier 1 Qual',     as: :currency, visible: false
    col :tier2_qual,       label: 'Tier 2 Qual',     as: :currency, visible: false
    col :tier3_qual,       label: 'Tier 3 Qual',     as: :currency, visible: false
    col :tier1_amt,        label: 'Tier 1 Amt',      as: :currency
    col :tier2_amt,        label: 'Tier 2 Amt',      as: :currency
    col :tier3_amt,        label: 'Tier 3 Amt',      as: :currency
    col :total_fee,        label: 'Total Fee',       as: :currency
    col :invoice_net,      label: 'Net Invoice Amt', as: :currency
    col :net_savings,      label: 'Net Savings Amt', as: :currency

    actions_col do |resource|
      link_to 'Bill', billing_customer_path(resource.custid), title: 'Billing', class: 'btn btn-sm btn-outline-secondary'
    end

    aggregate :total do |values, column|
      case column[:name]
      when :custname
        values.size
      when :current_total,
           :accelerate_total,
           :gross_savings,
           :tier1_qual,
           :tier2_qual,
           :tier3_qual,
           :tier1_amt,
           :tier2_amt,
           :tier3_amt,
           :total_fee
        number_to_currency(values.compact.sum)
      end
    end
  end

end
