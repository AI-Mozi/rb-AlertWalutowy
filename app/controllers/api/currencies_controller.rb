module Api
  class CurrenciesController < ApplicationController
    def index
      @currencies = Currency.all.pluck(:name, :value)
      render(json: @currencies)
    end
  end
end
