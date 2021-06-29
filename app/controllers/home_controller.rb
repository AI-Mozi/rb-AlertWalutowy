class HomeController < ApplicationController
  include HomeHelper

  def index
    @currencies = Currency.all
    @main_currencies = ['euro', 'dolar amerykański', 'funt szterling', 'jen (Japonia)']
    @chart_currencies = CurrencyHistory.where(currency_id: Currency.find_by(name: 'euro'))
    @chart_data = helpers.chart_data(@chart_currencies)
    @name = 'EURO'

    @main_currency_chart = @chart_currencies.pluck(:day, :mid)
    @gold = Gold.last

    change_currency(params[:id]) if params[:id].present? && Currency.find_by_name(params[:id]).present?
  end

  private

  def change_currency(id)
    @chart_currencies = CurrencyHistory.where(currency_id: Currency.find_by(name: id))
    @chart_data = helpers.chart_data(@chart_currencies)
    @name = id.upcase
    @main_currency_chart = @chart_currencies.pluck(:day, :mid)
  end
end
