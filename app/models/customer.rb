class Customer < ApplicationRecord
  self.table_name  = 'tblcustomer'
  self.primary_key = 'custid'

  def to_s
    custbusinessname
  end
end
