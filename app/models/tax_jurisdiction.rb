class TaxJurisdiction < ApplicationRecord
  self.table_name  = 'tbltaxjurisdiction'
  self.primary_key = 'tjid'

  def to_s
    "#{jurisdictionname} (#{jurisdictioncode})"
  end
end
