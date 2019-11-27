class SessionsController < ApplicationController
  before_action :find_user, only: [:create]

  def create
    unless @user
      flash[:danger] = "You are not authorized user."
      redirect_to root_path
      return
    end

    @user.update_user(request.env["omniauth.auth"])

    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "You have successfully signed in."
    else
      flash[:danger] = "Could not sign in. Error-BAD DATA"
    end

    redirect_to admin_dashboard_path
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

  private

  def find_user
    @user = User.find_by(email: request.env["omniauth.auth"].info.email)
  end
end
