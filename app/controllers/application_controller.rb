class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied, with: :access_denied

<<<<<<< HEAD
  helper_method :current_user

  def current_user
    @current_user ||= FacebookUser.find(session[:user_id]) if session[:user_id]
  end
=======
  layout :layout_by_resource
>>>>>>> 9fba62329a2573994f1c891639154ca631c10453

  private

  def access_denied(exception)
    store_location_for :user, request.path
    redirect_to user_signed_in? ? main_app.root_path : main_app.new_user_session_path, alert: exception.message
  end

  def layout_by_resource
    if devise_controller?
      "public"
    else
      "application"
    end
  end
end
