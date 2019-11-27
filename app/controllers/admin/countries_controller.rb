class Admin::CountriesController < Admin::AdminController
  before_action :find_country, only: [:edit, :update, :destroy]

  def index
    @pagy, @countries = pagy(Country.all, items: 20)
  end

  def new
    @country = Country.new
  end

  def create
    @country = Country.new(country_params)

    if @country.save
      redirect_to admin_countries_path, flash: { success: "Country has been successfully created." }
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @country.update(country_params)
      redirect_to admin_countries_path, flash: { success: "Country has been successfully updated." }
    else
      render "edit"
    end
  end

  def destroy
    @country.destroy
    flash[:danger] = "Country has been successfully deleted."
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
