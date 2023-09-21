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
    col :preorders, sort: false, search: false do |v|
      v.preorders.map do |id|
        link_to id, pre_order_path(id), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end.join("&nbsp;")
    end
    col :orders, sort: false, search: false do |v|
      v.orders.map do |id|
        link_to id, order_path(id), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end.join("&nbsp;")
    end

    col :current_total,    label: 'Market Total',    search: false, as: :currency
    col :accelerate_total, label: 'AU Total',        search: false, as: :currency
    col :gross_savings,    label: 'Savings',         search: false, as: :currency

    col :return_orders, sort: false, search: false do |v|
      v.return_orders.map do |id|
        link_to id, order_path(id), title: 'Show', class: 'btn btn-sm btn-outline-secondary'
      end.join("&nbsp;")
    end

    col :total_returns, search: false, as: :currency

    col :subscription_amount, search: false, as: :currency
    col :invoice_total, search: false, as: :currency


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
           :subscription_amount,
           :invoice_total
        number_to_currency(values.compact.sum)
      end
    end
  end

end
