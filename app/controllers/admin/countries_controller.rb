class Admin::CountriesController < ApplicationController
  before_action :authenticate_user, :authenticate_admin_user
  before_action :find_country, only: [:edit, :update, :destroy]

  def index
    @countries = Country.all
  end

  def new
    @country = Country.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def create
    @country = Country.new(country_params)
    if @country.save
      redirect_to admin_countries_path, flash: { success: "Successfully added a country"}
    else
      flash.now[:danger] = "Failed to add Country"
      render "new"
    end
  end

  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    if @country.update(country_params)
      redirect_to admin_countries_path, flash: { success: "Successfully updated the country" }
    else
      flash[:danger] = "Failed to update country"
      render "edit"
    end
  end

  def destroy
    @country.destroy
    flash[:success] = "Country deleted successfully"
    redirect_to admin_countries_path
  end

  private

  def country_params
    params.require(:country).permit(:name, :code, :active)
  end

  def find_country
    @country = Country.find(params[:id])
  end
end
