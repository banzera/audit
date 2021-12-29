class Order < ApplicationRecord
  self.table_name  = 'tblorder'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid

  has_many :items,           class_name: 'OrderItem',         foreign_key: :orderid
  has_many :pick_list_items, class_name: 'OrderDataPickList', foreign_key: :orderid

  scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where.not(preordercompletedate: nil) }
  scope :outstanding, -> { where(orderitemsid: OrderItem.unfulfilled.pluck(:orderid)) }

  scope :billed_on, -> (on) { where("DATE(orderccdate) = ?", on.to_date) }
  scope :billed_today, -> { billed_on(Date.today) }
  scope :cc_bill_due, -> {
    all
    .joins(:customer)
    .includes(:customer)
    .where.not(orderdelivereddate: nil)
    .where(orderdatepaid: nil)
    .where(orderccdate: nil)
    .where('tblcustomer.custccauth': true)
  }
  def to_s
    orderbatch
  end

  def mark_as_billed!
    update(orderccdate: Date.today)
  end

  def billed?
    orderccdate.present?
  end

  # pricing calcs... probably should be calced on item edit and stored on the table row
  def ordersubtotal
    items.pluck(:orderpricetotal).sum
  end

  def orderdeliverycosttotal
    items.pluck(:orderdeliverycosttotal).sum
  end

  def ordertaxtotal
    items.pluck(:ordertaxtotal).sum
  end

  def orderpricetotal
    ordersubtotal + orderdeliverycosttotal + ordertaxtotal
  end
end
