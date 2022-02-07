class PreOrder < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblpreorder'
  self.primary_key = 'preorderid'

  belongs_to :customer, foreign_key: :custid
  belongs_to :order,    foreign_key: :orderid,          optional: true
  belongs_to :vendor,   class_name: 'Supplier', foreign_key: :preordervendorid, optional: true

  has_many :items, class_name: 'PreOrderItem', foreign_key: :preorderid

  alias_attribute :notes, :preordernotes

  scope :analyzed,  -> { where.not(preorderanalysisdate: nil)}
  scope :confirmed, -> { where.not(confirmationdate: nil)}
  scope :checked,   -> { where.not(preordercheck: nil)}

  scope :awaiting_analysis, -> { confirmed.where.not(preorderanalysisdate: nil) }

  validates :preorderdate, presence: true

  has_batch_number :preorderbatch, date: :preorderdate, prefix: 'P-', attrs: 'customer.custname' do
    PreOrder
      .where("DATE(preorderdate) = ?", self.preorderdate)
      .where(custid: self.custid)
      .count || 0
  end

  def create_order!
    create_order(
      orderdate:    self.preorderdate,
      custid:       self.custid,
      ordertaxrate: customer.custtaxrate
      )

    save
  end

  # pricing calcs... probably should be calced on item edit and stored on the table row
  def ordersubtotal
    items.pluck(:orderpricetotal2).compact.sum
  end

  def ordertaxtotal
    ordersubtotal * customer.custtaxrate
  end

  def orderpricetotal
    ordersubtotal + ordertaxtotal
  end


  def create_order_items_sql
    qryPreOrderToOrder = <<~SQL
      INSERT INTO tblOrderItems (
        OrderID, SKUID, OrderQuant,
        OrderPricePer, OrderPriceTotal,
        OrderTaxRate,  OrderTaxTotal,
        OrderDeliveryCostTotal,
        OrderFeesTotal,
        OrderGrandTotal,
        orderdeliveredquant,
        POID
      )

      SELECT
        #{self.orderid} as orderid,
        tblPreOrderItems.skuid2,
        tblPreOrderItems.orderquant2,
        tblPreOrderItems.orderpriceper2,
        tblPreOrderItems.orderpricetotal2,
        tblCustomer.CustTaxRate,
        round((orderpricetotal2 * CustTaxRate)::numeric, 2) as tax_total,
        0 as delivery_cost,       -- this is only while the order item OrderDeliveryCostTotal doesn't default to 0
        0 as fees,                -- this is only while the order item OrderFeesTotal doesn't default to 0
        round((orderpricetotal2 + round((orderpricetotal2 * CustTaxRate)::numeric, 2))::numeric, 2) as OrderGrandTotal,
        0 as orderdeliveredquant,  -- this is only while the order item orderdeliveredquant doesn't default to 0
       CASE tblPreOrderItems.POID
       WHEN 0 THEN NULL
       ELSE tblPreOrderItems.POID
       END
      FROM tblPreOrderItems
      LEFT JOIN tblPreOrder ON tblPreOrder.PreOrderID = tblPreOrderItems.PreOrderID
      LEFT JOIN tblCustomer ON tblPreOrder.CustID     = tblCustomer.CustID
      WHERE tblPreOrderItems.PreOrderItemCode < 4
        AND tblPreOrderItems.PreOrderID = #{self.preorderid}
        AND tblPreOrderItems.OrderDate ISNULL
        AND tblPreOrderItems.skuid2 > 0
    SQL
  end

  def update_pre_order_item_date_sql
    qryPreOrderOrderUpdateDate = <<~SQL
      UPDATE tblPreOrderItems
      SET   OrderDate = Now()
      WHERE OrderDate ISNULL
        AND PreOrderItemCode != 4
        AND PreOrderID = #{self.preorderid}
        AND (POID != 0 OR POID ISNULL)
    SQL
  end

  # def qryPreOrderOrderDateUpdate
  #   qryPreOrderOrderDateUpdate = <<~SQL
  #     UPDATE tblPreOrder
  #     LEFT JOIN tblOrder ON tblPreOrder.OrderID = tblOrder.OrderID
  #     SET tblPreOrder.OrderCreateDate = Now(),
  #         tblOrder.PreOrderCompleteDate = Now()
  #     WHERE tblPreOrder.PreOrderID = #{self.preorderid} [Forms]![frmPreOrder]![txtPreOrderID])
  #       AND (([Forms]![frmPreOrder]![txtPreOrderCompleteCheck])=0))
  #   SQL
  # end

  def pre_order_complete_check
    items.map(&:incomplete?)
  end

  def pre_order_complete?
    pre_order_complete_check.none?
  end

  def order_update!
    return unless order.present?

    transaction do
      # create order items
      PreOrder.connection.execute create_order_items_sql

      # update dates on pre-order items
      PreOrder.connection.execute update_pre_order_item_date_sql

      # update dates on pre-order and order
      if pre_order_complete?
        t = Time.current
        self.ordercreatedate = t
        self.order.preordercompletedate = t

        save && order.save
      end
    end
  end
end
