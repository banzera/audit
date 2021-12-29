class OrderCcBillDue < ApplicationRecord
  self.table_name  = 'qryorderccbilldue'
  self.primary_key = 'orderid'

  belongs_to :customer, foreign_key: :custid

  def to_s
    orderbatch
  end
end
