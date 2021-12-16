class SkuClass < ApplicationRecord
  self.table_name  = 'tblskuclass'
  self.primary_key = 'skuclassid'

  # belongs_to :sku, foreign_key: :skuclassid

  def to_s
    skuclassdesc || '<blank>'
  end
end
