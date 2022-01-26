class SupplierPayment < ApplicationRecord
  self.table_name  = 'tblsupplierpmts'
  self.primary_key = 'splrid'

  def title

  end

  def to_s
    super
  end
end
