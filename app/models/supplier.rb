class Supplier < ApplicationRecord
  self.table_name  = 'tblsupplier'
  self.primary_key = 'splrid'

  def title
    splrbusinessname
  end

  def to_s
    self.splrname
  end

  NONE_ID = 49
  NONE = begin
    find_or_create_by(splrid: NONE_ID) do |supplier|
      supplier.splrname = 'NONE01'
    end
  end

end
