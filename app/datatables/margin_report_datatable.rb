class MarginReportDatatable < Effective::Datatable

  collection do
    customer = attributes[:customer]
    scope    = customer.present? ? MarginReport.for_customer(customer) : MarginReport.none

    scope = scope.where(preordercodeid: [1,2,3,5,6])
    scope
  end

  filters do
    scope :prev5, label: scope_label(5)
    scope :prev4, label: scope_label(4)
    scope :prev3, label: scope_label(3)
    scope :prev2, label: scope_label(2)
    scope :prev1, label: scope_label(1)
    scope :current, default: true
  end

  def scope_label(x)
    month_no = (Date.today.month - x) % 12
    month_no += 12 if month_no <= 0
    I18n.t('date.abbr_month_names')[month_no]
  end

  def multi_value_row(*values)
    view.content_tag(:div, values.extract_options!) do
      values.map {|v| view.content_tag(:span, v)}.join('<br>'.html_safe).html_safe
    end
  end

  datatable do
    length :all
    order :preorderitemsid, :asc

    col :preorderitemsid, visible: false

    val :curr, label: '' do |i| multi_value_row('Current', 'Accelerate') end

    col :preordercode, label: 'Code'

    col :order_date,   label: 'Order ID/Date', partial: 'margin_report_items/dt/order_and_date'
    col :sku,          label: 'SKU'    do |i| multi_value_row i.skuid1, i.skuid2 end
    col :manf,         label: 'Manf'   do |i| multi_value_row i.manf, i.manf2 end
    col :itemno,       label: 'Item #' do |i| multi_value_row i.itemno, i.itemno2 end
    col :qty,          label: 'Qty'    do |i| multi_value_row i.orderquant1, i.orderquant2 end
    col :price_each, label: 'Price Per' do |i|
      multi_value_row number_to_currency(i.orderpriceper1),
                      number_to_currency(i.orderpriceper2), class: 'text-right text-monospace'
    end

    col :price_total, label: 'Price Total' do |i|
      multi_value_row number_to_currency(i.orderpricetotal1),
                      number_to_currency(i.orderpricetotal2), class: 'text-right text-monospace'
    end

    aggregate :total do |values, column|
      case column[:name]
      when :sku
        values.size
      when :price_each
        multi_value_row fa_icon('arrow-right', right: true, text: 'Current Total'),
                        fa_icon('arrow-right', right: true, text: 'Accelerate Total'),
                        fa_icon('arrow-right', right: true, text: 'Savings'),
                        { class: 'text-right' }

      when :price_total
        p1 = values.map(&:orderpricetotal1).compact.sum
        p2 = values.map(&:orderpricetotal2).compact.sum

        savings = p1 - p2
        multi_value_row number_to_currency(p1),
                        number_to_currency(p2),
                        number_to_currency(savings),
                        class: 'text-right text-monospace'
      end
    end
  end
end
