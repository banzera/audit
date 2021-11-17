class ApplicationController < ActionController::Base

  before_action :authenticate_user!
  protect_from_forgery with: :exception, unless: -> { request.format.json? }

  rescue_from Effective::AccessDenied do |exception|
    respond_to do |format|
      format.html { render 'application/access_denied', :status => 403 }
      format.any { render :text => 'Access Denied', :status => 403 }
    end
  end
end
