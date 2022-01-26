class OrderDeposit < ApplicationRecord
  include HasBatch

  self.table_name  = 'tblorderdeposit'
  self.primary_key = 'odepositid'

  belongs_to :order_payment_item, foreign_key: :odepositid
end
