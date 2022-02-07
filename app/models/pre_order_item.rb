class PreOrderItem < ApplicationRecord
  self.table_name  = 'tblpreorderitems'
  self.primary_key = 'preorderitemsid'

  include HasParent
  parent :pre_order

  belongs_to :pre_order,      class_name: 'PreOrder',      foreign_key: :preorderid, inverse_of: :items
  belongs_to :sku1,           class_name: 'Sku',           foreign_key: :skuid1
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

  validates_presence_of :sku1, :orderquant1, :orderpriceper1, :orderpricetotal1, on: :create

  scope :direct_order, -> { where(preorderitemcode: PreOrderCode::DIRECT) }
  scope :qualified,    -> { where.not(preorderitemcode: PreOrderCode::DIRECT) }

  scope :for_confirmation, -> { joins(:sku2).includes(:sku2).qualified.order(:manf) }

  scope :recent,      -> { order(preorderitemsid: :desc).limit(100) }
  scope :outstanding, -> { where(preorderitemcode: [PreOrderCode::EXACT, PreOrderCode::SUB, PreOrderCode::NEW]).
                           where('poid isnull or poid=0') }

  def diff_quant
    self.poorderquant - self.poorderrcvdquant
  end

  def to_s
     "Item for #{pre_order}"
  end

  def incomplete?
    # expr from access
    # =Sum(IIf(IsNull([OrderDate]) And   ([SKUID2]<>0) And   ([PreOrderItemCode]<4) ,1,0))
    orderdate.blank? && skuid2 != 0 && preorderitemcode < 4
  end

end
