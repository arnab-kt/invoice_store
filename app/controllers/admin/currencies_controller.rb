class Admin::CurrenciesController < ApplicationController
    before_action :find_currency, only: [:edit, :update, :destroy]

  def index
    @pagy, @currencies = pagy(Currency.all, items: 20)
  end

  def new
    @currency = Currency.new
  end

  def create
    @currency = Currency.new(currency_params)

    if @currency.save
      redirect_to admin_currencies_path, flash: { success: "Currency has been successfully created." }
    else
      render "new"
    end
  end

  def edit; end

  def update
    if @currency.update(currency_params)
      redirect_to admin_currencies_path, flash: { success: "Currency has been successfully updated." }
    else
      render "edit"
    end
  end

  def destroy
    @currency.destroy
    flash[:danger] = "Currency has been successfully deleted."
    redirect_to admin_currencies_path
  end

  private

  def currency_params
    params.require(:currency).permit(:name, :code, :active)
  end

  def find_currency
    @currency = Currency.find(params[:id])
  end
end
