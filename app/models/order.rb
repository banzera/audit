class Order < ApplicationRecord
  self.table_name  = 'tblorder'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid
  has_many :pick_list_items, class_name: 'OrderDataPickList', foreign_key: :orderid

  scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where.not(preordercompletedate: nil) }
  scope :outstanding, -> { where(orderitemsid: OrderItem.unfulfilled.pluck(:orderid)) }

  def to_s
    orderbatch
  end
end
