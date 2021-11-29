class Customer < ApplicationRecord
  self.table_name  = 'tblcustomer'
  self.primary_key = 'custid'

  def to_s
    custbusinessname
  end

  alias_attribute :created_at, :custdatecreated
  alias_attribute :updated_at, :custdatemodified
end
