class InventoryCounts < ApplicationRecord
  self.table_name  = 'qryinventorycounts'
  self.primary_key = 'skuid'

  belongs_to :sku, foreign_key: :skuid

  scope :in_dc,      -> { where('dccurquant > 0') }
  scope :in_transit, -> { where('totaldue > 0') }
end
