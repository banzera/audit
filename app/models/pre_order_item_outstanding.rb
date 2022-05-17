class PreOrderItemOutstanding < ApplicationRecord
  self.table_name  = 'pre_order_items_outstandings'
  self.primary_key = 'preorderitemsid'

  belongs_to :pre_order,      foreign_key: :preorderid
  belongs_to :pre_order_code, foreign_key: :preorderitemcode
  belongs_to :purchase_order, foreign_key: :poid

  # scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where.not(preordercompletedate: nil) }
  # scope :outstanding, -> { all }

  # scope :known_location,   -> { where.not(dcloc: Sku::DC_LOC_NONE) }
  # scope :unknown_location, -> { where(dcloc: Sku::DC_LOC_NONE) }
  # scope :in_stock,         -> { where('dccurquant > 0') }
  # scope :for_customer,     -> custid { where(custid: custid) }

  def in_stock?
    dccurquant.positive?
  end
end
