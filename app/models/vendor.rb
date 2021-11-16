class Vendor < ApplicationRecord
  self.table_name  = 'tblvendor'
  self.primary_key = 'vendorid'

  def to_s
    vendorname
  end

end
