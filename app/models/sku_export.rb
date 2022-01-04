class SkuExport < ApplicationRecord
  self.table_name  = 'sku_export'
  self.primary_key = 'skuid'

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      SkuExport.find_each do |sku|
        csv << sku.attributes.values_at(*column_names)
      end
    end
  end

end
