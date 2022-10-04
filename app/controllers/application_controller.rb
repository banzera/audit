class ApplicationController < ActionController::Base
  include PdfHandling

  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  before_action :authenticate_user!
  before_action :set_paper_trail_whodunnit

  around_action :set_effective_logging_current_user

  before_action do
    if current_user && current_user.is_admin?
      Rack::MiniProfiler.authorize_request
    end
  end

  rescue_from Effective::AccessDenied do |exception|
    respond_to do |format|
      format.html { render 'application/access_denied', :status => 403 }
      format.any { render :text => 'Access Denied', :status => 403 }
    end
  end

  rescue_from ActiveRecord::RecordNotFound, :with => :not_found

  def not_found
    logger.info "Bad route caught by #{controller_path} controller..."
    error    = {code: 404, message: Rack::Utils::HTTP_STATUS_CODES[404]}

    respond_to do |format|
      format.html { render 'application/404', :status => :not_found }
      format.xml  { render :xml  => error.to_xml(root: :error), :status => :not_found }
      format.json { render :json => {error: error},             :status => :not_found }
      format.all  { head :not_found }
    end
  end

  def require_blazer_admin
    # depending on your auth, something like...
    redirect_to '/' unless current_user && current_user.is_admin?
  end
end
