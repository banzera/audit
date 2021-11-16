class Supplier < ApplicationRecord
  self.table_name  = 'tblsupplier'
  self.primary_key = 'splrid'

  def title
    splrbusinessname
  end

  def to_s
    self.splrname
  end
end
