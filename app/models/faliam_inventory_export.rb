class FaliamInventoryExport < ApplicationRecord
  self.table_name  = 'faliam_inventory_exports'
  self.primary_key = 'Provider SKU'

  def to_s
    "SKU #{id} (#{self["Description"]&.truncate(20) || '<no description>'})"
  end


end
