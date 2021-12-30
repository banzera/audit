class SkuCustInfo < ApplicationRecord
  self.table_name  = 'tblskucustinfo'
  self.primary_key = 'skucustinfoid'

  belongs_to :customer, foreign_key: :custid
  belongs_to :sku, foreign_key: :skuid

  scope :always,-> { where(skuonly: true) }
  scope :never, -> { where(skunever: true) }

  scope :only_for,  -> (sku) { always.where(skuid: sku) }
  scope :never_for, -> (sku) { never.where(skuid: sku) }

end
