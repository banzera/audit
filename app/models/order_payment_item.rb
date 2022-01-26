class OrderPaymentItem < ApplicationRecord
  self.table_name  = 'tblorderpmtsitems'
  self.primary_key = 'opmtsitemsid'

  belongs_to :order_payment, foreign_key: :opmtsid
  belongs_to :order_item,    foreign_key: :orderitemsid
  belongs_to :deposit,       class_name: 'OrderDeposit', foreign_key: :odepositid

end
