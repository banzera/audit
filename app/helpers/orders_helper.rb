module OrdersHelper

  def ordered_items_in_batch(oid)

    @items_a.select do |i| i.orderid == oid end
  end

  def batches_for_customer(cust_id)
    @items_a.select do |i| i.custid == cust_id end
            .uniq   do |i| i.orderid end
  end

  # order items outstanding
  def order_date_style(d)
    if d < 21.days.ago
      'bg-danger'
    elsif d < 14.days.ago
      'bg-danger disabled'
    end
  end

  def order_item_row_style(item)
    if item.in_stock?
      'bg-highlight'
    end
  end

  # pick list
  def pick_list_cell_style(pick)
    if pick.orderquantdue.positive?
      'bg-highlight'
    elsif pick.orderquantdue.negative?
      'bg-danger'
    end
  end

  # ship list
  def ship_list_cell_style(item)
    ship_date = item.orderitemsdelivereddate&.to_date

    if ship_date.blank?
      ''
    elsif ship_date == Date.today
      'bg-highlight'
    else
      'bg-peach'
    end

  end

  def ship_list_remaining_style(item)
    due = item.sumoforderquant - item.sumoforderdeliveredquant
    return 'bg-success' if due.positive?
  end

end
