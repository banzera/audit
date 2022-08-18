class PreOrderItemOutstanding < ApplicationRecord
  self.table_name  = 'pre_order_items_outstandings'
  self.primary_key = 'preorderitemsid'

  belongs_to :pre_order,      foreign_key: :preorderid
  belongs_to :pre_order_item, foreign_key: :preorderitemsid
  belongs_to :pre_order_code, foreign_key: :preorderitemcode
  belongs_to :purchase_order, foreign_key: :poid
  belongs_to :sku,            foreign_key: :skuid2

  scope :in_stock, -> { where('dccurquant > 0') }

  def in_stock?
    dccurquant.positive?
  end
end
