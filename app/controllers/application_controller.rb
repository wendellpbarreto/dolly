class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :access_denied

  helper_method :current_user

  def current_user
    @current_user ||= FacebookUser.find(session[:user_id]) if session[:user_id]
  end

  private

  def access_denied(exception)
    store_location_for :user, request.path
    redirect_to user_signed_in? ? main_app.root_path : main_app.new_user_session_path, alert: exception.message
  end
end
