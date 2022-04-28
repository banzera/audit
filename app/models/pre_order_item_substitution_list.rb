class PreOrderItemSubstitutionList < ApplicationRecord

  self.table_name  = 'qrypreordersublist'
  self.primary_key = 'skuid1'

  belongs_to :sku1, class_name: 'Sku', foreign_key: :skuid1
  belongs_to :sku2, class_name: 'Sku', foreign_key: :skuid2

end
