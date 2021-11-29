class ScansController < ActionController::Base

  skip_forgery_protection

  def post
    @scan = InventoryScanOperation.new

    @scan.user_id = lookup_scan_user
    @scan.dc_loc  = dc_loc

    @scan.sku_id      = scan_params[:tid]
    @scan.scanned_at  = scan_params[:scanned_at_utc]
    @scan.received_at = scan_params[:received_at_utc]
    @scan.payload     = scan_params
    @scan.request     = request_params

    if @scan.save
      # CodeReadrService.process_scan(@scan)
    else
    end
  end

  def scan_params
    params.require(:scan).permit([
      :tid,
      :timestamp,
      :scanned_at_utc,
      :received_at_utc,
      :scanid,
      :sid,
      :text,
      :udid,
      :userid,
      :deviceid,
      :status,
      :time_zone,
      :capture_type,
      :scan_updated,
      :scan_dbb_record,
      questions: [],
      answers: [],
    ])
  end

  def dc_loc
    scan_params[:answers].values.first
  end

  def request_params
    {}
  end
end


