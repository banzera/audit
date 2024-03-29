class Order < ApplicationRecord
  include HasBatch
  include HasBarcode

  self.table_name  = 'tblorder'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid

  has_one :pre_order,    foreign_key: :orderid

  has_many :items,           class_name: 'OrderItem',         foreign_key: :orderid, dependent: :destroy
  has_many :pick_list_items, class_name: 'OrderDataPickList', foreign_key: :orderid
  has_many :ship_list_items, class_name: 'OrderDataShipList', foreign_key: :orderid

  scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where(preordercompletedate: nil) }
  scope :outstanding, -> { where(orderid: OrderItem.unfulfilled.pluck(:orderid)) }

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

  attr_accessor :ship_date

  before_create do
    self.ordertaxrate = customer.custtaxrate
  end

  has_barcode :barcode,
    :outputter => :svg,
    :type => :code_39,
    :value => Proc.new { |o| o.orderid.to_s }

  has_batch_number :orderbatch, date: :orderdate, attrs: 'customer.custname' do
    Order
      .select(:orderid, :orderbatch)
      .where("DATE(orderdate) = ?", self.orderdate)
      .where(custid: self.custid)
      .order(:orderbatch)
      .last&.orderbatch
  end

  def autocalc_delivered_date!
    odd = if outstanding_items_count.zero?
      # if there are items, use the latest date, if no items exist (e.g. all
      # items were drop-shipped) then use today's date
      items.maximum(:orderitemsdelivereddate) || Date.today
    end
    update(orderdelivereddate: odd)
  end

  def mark_as_billed!
    update(orderccdate: Date.today)
  end

  def invoiceable?
    orderdelivereddate.present? && preordercompletedate.present?
  end

  def billed?
    orderccdate.present?
  end

  def billable?
    invoiceable? && !billed?
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

  def drop_ship_items
    return [] unless self.pre_order.present?

    self.pre_order
        .items
        .where("preorderitemcode > 4")
        .joins(:sku1)
        .includes(:sku1)
        .order(:manf)
  end

  def to_s
    "Order #{orderid}"
  end
end
