class HomeController < ApplicationController
  def index
    @currencies = Currency.all
    @main_currencies = ['euro', 'dolar amerykański', 'funt szterling']
  end
end
