class CurrenciesConverterController < ApplicationController
  def index
    @currency = params[:currency]
    @to_currency = params[:to_currency]
    @amount = params[:amount]
    @converted_currency = CurrencyConverterService.call(@currency, @to_currency, @amount)

    respond_to do |f|
      f.js
    end
  end
end
