class SupplierPaymentItem < ApplicationRecord
  include HasBatch
  self.table_name  = 'tblsupplierpmtsitems'
  self.primary_key = 'orderid'

end
