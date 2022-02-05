class Order < ApplicationRecord
  include HasBatch
  include HasBarcode

  self.table_name  = 'tblorder'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid

  has_many :items,           class_name: 'OrderItem',         foreign_key: :orderid
  has_many :pick_list_items, class_name: 'OrderDataPickList', foreign_key: :orderid
  has_many :ship_list_items, class_name: 'OrderDataShipList', foreign_key: :orderid

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

  validates :orderdelivereddate, absence: { message: 'cannot be set if there are outstanding items' },
                                  if: -> { outstanding_items_count.positive? || preordercompletedate.blank? }
  validates :orderdelivereddate, absence: { message: 'cannot be set if the pre-order is incomplete' },
                                  if: -> { preordercompletedate.blank? }

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_39,
    :value => Proc.new { |o| o.orderid.to_s }

  has_batch_number :orderbatch, attrs: 'customer.custname' do
    Order
      .where("DATE(orderdate) = ?", self.orderdate)
      .where(custid: self.custid)
      .count || 0
  end

  def mark_as_billed!
    update(orderccdate: Date.today)
  end

  def billed?
    orderccdate.present?
  end

  # pricing calcs... probably should be calced on item edit and stored on the table row
  def ordersubtotal
    items.pluck(:orderpricetotal).compact.sum
  end

  def orderdeliverycosttotal
    items.pluck(:orderdeliverycosttotal).compact.sum
  end

  def ordertaxtotal
    items.pluck(:ordertaxtotal).compact.sum
  end

  def orderpricetotal
    ordersubtotal + orderdeliverycosttotal + ordertaxtotal
  end

  def outstanding_items_count
    items.map(&:diff_quant).sum
  end

  def to_s
    "Order #{orderid}"
  end
end
