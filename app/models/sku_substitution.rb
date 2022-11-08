class SkuSubstitution < ApplicationRecord

  belongs_to :house_brand, class_name: 'Sku', primary_key: :skuid
  belongs_to :sub,         class_name: 'Sku', primary_key: :skuid

end
