class Category < ApplicationRecord
  self.table_name  = 'tblcategory'
  self.primary_key = 'categoryid'

  def to_s
    categorydesc
  end

end
