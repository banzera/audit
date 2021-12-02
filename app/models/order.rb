class Order < ApplicationRecord
  self.table_name  = 'tblorder'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid

  scope :awaiting_confirmation, -> { where(orderconfirmdate: nil).where.not(preordercompletedate: nil) }
  scope :outstanding, -> { all }

  def to_s
    orderbatch
  end
end
