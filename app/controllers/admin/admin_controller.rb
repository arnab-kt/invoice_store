class Admin::AdminController < ApplicationController
  before_action :authenticate_user, :authenticate_admin_user

  def dashboard
  end
end
