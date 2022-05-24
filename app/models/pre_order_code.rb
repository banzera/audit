class PreOrderCode < ApplicationRecord
  self.table_name  = 'tblpreordercodes'
  self.primary_key = 'preordercodeid'

  EXACT  = 1
  SUB    = 2
  NEW    = 3
  DIRECT = 4
  SCHEIN = 5
  CRAZY  = 6

  def to_s
    "(#{preordercode}) #{preordercodedesc}"  || '<blank>'
  end
end
