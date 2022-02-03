class CodeReadrService

  def self.process_scan(scan)
    return false unless scan.sku.present?
    sku       = scan.sku
    sku.dcloc = scan.dc_loc
    sku.save validate: false
  end

end
