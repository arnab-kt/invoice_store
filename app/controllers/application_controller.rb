class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def authenticate_user
    redirect_to login_path unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def authenticate_admin_user
    authenticate_user
    return unless current_user

    redirect_to root_path, flash: { danger: "Need to have admin access" } unless current_user.admin
  end
end
