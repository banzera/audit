class ApplicationController < ActionController::Base
  include PdfHandling

  before_action :authenticate_user!
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

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
end
