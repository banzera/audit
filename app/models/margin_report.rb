class MarginReport < ApplicationRecord
  self.table_name  = 'margin_report'
  self.primary_key = 'preorderitemsid'

  belongs_to :pre_order,      class_name: 'PreOrder',      foreign_key: :preorderid
  belongs_to :sku1,           class_name: 'Sku',           foreign_key: :skuid1          , optional: true
  belongs_to :sku2,           class_name: 'Sku',           foreign_key: :skuid2          , optional: true
  belongs_to :code,           class_name: 'PreOrderCode',  foreign_key: :preorderitemcode, optional: true
  belongs_to :purchase_order, class_name: 'PurchaseOrder', foreign_key: :poid            , optional: true

  alias_attribute :requested_qty, :orderquant1
  alias_attribute :proposed_qty,  :orderquant2

  alias_attribute :requested_priceper,   :orderpriceper1
  alias_attribute :proposed_priceper,    :orderpriceper2
  alias_attribute :requested_pricetotal, :orderpricetotal1
  alias_attribute :proposed_pricetotal,  :orderpricetotal2

  alias_attribute :au_priceper, :orderaupriceper
  alias_attribute :itemcode,    :preorderitemcode
  alias_attribute :notes,       :preordernotes
  alias_attribute :urgent,      :preorderurgent

  scope :for_customer, -> (customer) { where(custid: customer) }
  scope :in_range,     -> (date_range) { where(preorderdate: date_range) }

  scope :current, -> { in_range(monthrange(0)) }
  scope :prev1,   -> { in_range(monthrange(1)) }
  scope :prev2,   -> { in_range(monthrange(2)) }
  scope :prev3,   -> { in_range(monthrange(3)) }
  scope :prev4,   -> { in_range(monthrange(4)) }
  scope :prev5,   -> { in_range(monthrange(5)) }

  attr_accessor :start_date

  def self.monthrange(x)
    day = Date.today - x.month
    day.beginning_of_month..day.end_of_month
  end

  def readonly?
    true
  end

  def diff_quant
    self.poorderquant - self.poorderrcvdquant
  end

  def to_s
     "Margin Report for #{pre_order}"
  end


end
