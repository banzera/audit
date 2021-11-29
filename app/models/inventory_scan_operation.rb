class InventoryScanOperation < ApplicationRecord

  belongs_to :user, optional: true
  belongs_to :sku,  optional: true

end
