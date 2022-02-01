class SkuPoHistory < ApplicationRecord
  self.table_name  = 'qryskupohistau2'
  self.primary_key = 'poid'

  def readonly?; true; end

  scope :for_po,  -> po  { where(poid: po) }
  scope :for_sku, -> sku { where(skuid: sku) }

  scope :available, -> { where('available > 0') }
  scope :in_dc,     -> { where('in_dc > 0') }

  belongs_to :purchase_order, foreign_key: :poid
  belongs_to :sku,            foreign_key: :skuid

  def expiration_date
    poorderexpiration&.to_date
  end
end
