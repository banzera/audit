class OrderPayment < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblorderpmts'
  self.primary_key = 'opmtsid'

  has_many :items, class_name: 'OrderPaymentItem', foreign_key: :opmtsid

  has_batch_number :opmtsbatch
  has_batch_number :opmtsbatch, date: :opmtsdate do
    OrderPayment
      .select(:opmtsid, :opmtsbatch)
      .where("DATE(opmtsdate) = ?", self.opmtsdate)
      .order(:opmtsbatch)
      .last&.opmtsbatch
  end

end
