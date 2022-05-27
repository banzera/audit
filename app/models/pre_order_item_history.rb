class PreOrderItemHistory < ApplicationRecord

  self.table_name  = 'frm_preorder_subform6'
  self.primary_key = 'skuid'

  belongs_to :sku,      class_name: 'Sku',      foreign_key: :skuid
  belongs_to :customer, class_name: 'Customer', foreign_key: :custid
  belongs_to :vendor,   class_name: 'Supplier', foreign_key: :splrid
  belongs_to :supplier, class_name: 'Supplier', foreign_key: :splrid2

end
