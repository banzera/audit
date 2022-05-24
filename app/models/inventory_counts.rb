class InventoryCounts < ApplicationRecord
  self.table_name  = 'qryinventorycounts'
  self.primary_key = 'skuid'

  belongs_to :sku, foreign_key: :skuid

  scope :in_dc,      -> { where('dccurquant > 0') }
  scope :in_transit, -> { where('totaldue > 0') }

  scope :no_stock,     -> { where('dccurquant <= 0') }
  scope :no_location,  -> { where(dcloc: Sku::DC_LOC_NONE) }
  scope :has_location, -> { where.not(dcloc: Sku::DC_LOC_NONE ) }
end
