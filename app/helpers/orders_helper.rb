module OrdersHelper

  def batches_for_customer(cust_id)
    @batches = @items.where(custid: cust_id)
                     .distinct(:orderid)
                     .order(:orderid)
  end

  def order_date_style(d)
    if d < 21.days.ago
      'bg-danger'
    elsif d < 14.days.ago
      'bg-danger disabled'
    end
  end

  def order_item_row_style(item)
    if item.in_stock?
      'bg-warning'
    end
  end

  def pick_list_cell_style(pick)
    if pick.orderquantdue.positive?
      'bg-warning'
    elsif pick.orderquantdue.negative?
      'bg-danger'
    end
  end
end
