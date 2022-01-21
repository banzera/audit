class CodeReadrService

  def self.process_scan(scan)
    return false unless scan.sku.present?
    scan.sku.update(dc_loc: scan.dc_loc)
  end

end
