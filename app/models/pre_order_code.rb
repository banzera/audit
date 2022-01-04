class PreOrderCode < ApplicationRecord
  self.table_name  = 'tblpreordercodes'
  self.primary_key = 'preordercodeid'

  def to_s
    "(#{preordercode}) #{preordercodedesc}"  || '<blank>'
  end
end
