class OrderItemOutstanding < ApplicationRecord
  self.table_name  = 'qry_order_items_outstanding'
  self.primary_key = 'orderitemsid'

  belongs_to :customer,       foreign_key: :custid
  belongs_to :order,          foreign_key: :orderid
  belongs_to :purchase_order, foreign_key: :poid

  # scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where.not(preordercompletedate: nil) }
  # scope :outstanding, -> { all }

  scope :no_issues,        -> { where.not(has_issue: true) }
  scope :known_location,   -> { where.not(dcloc: Sku::DC_LOC_NONE) }
  scope :unknown_location, -> { where(dcloc: Sku::DC_LOC_NONE) }
  scope :in_stock,         -> { where('dccurquant > 0') }
  scope :for_customer,     -> custid { where(custid: custid) }

  def in_stock?
    dccurquant.positive?
  end
end
