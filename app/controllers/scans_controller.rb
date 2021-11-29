class ScansController < ActionController::Base

  skip_forgery_protection

  def post
    @scan = InventoryScanOperation.new

    # scan.user_id    = lookup_scan_user
    @scan.sku_id      = scan_params['Scan Value']
    @scan.dc_loc      = scan_params['DC Location']
    @scan.scanned_at  = scan_params['']
    @scan.received_at = scan_params['']

    @scan.properties  = scan_params

    @scan.save
  end

  def scan_params
    params.permit!
  end
end


