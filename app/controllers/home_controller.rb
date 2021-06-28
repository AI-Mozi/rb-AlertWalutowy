class HomeController < ApplicationController
  def index
    @currencies = Currency.all
    @main_currencies = ['euro', 'dolar amerykański', 'funt szterling']
    @chart_currencies = CurrencyHistory.where(currency_id: Currency.find_by(name: 'euro'))
    @euro = @chart_currencies.pluck(:day, :mid)

    @gold = Gold.last
  end
end
