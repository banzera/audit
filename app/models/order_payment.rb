class OrderPayment < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblorderpmts'
  self.primary_key = 'opmtsid'

  has_many :items, class_name: 'OrderPaymentItem', foreign_key: :opmtsid

  has_batch_number :opmtsbatch
end
