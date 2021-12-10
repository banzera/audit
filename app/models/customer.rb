class Customer < ApplicationRecord
  self.table_name  = 'tblcustomer'
  self.primary_key = 'custid'

  def full_name
    "#{custsal} #{custfirst} #{custlast}"
  end

  def city_state_zip
    "#{custcity}, #{custst} #{custzip}"
  end

  def to_s
    custbusinessname
  end

  alias_attribute :created_at, :custdatecreated
  alias_attribute :updated_at, :custdatemodified
end
