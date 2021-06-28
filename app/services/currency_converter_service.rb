class CurrencyConverterService < ApplicationService
  attr_accessor :currency, :to_currency, :amount

  def initialize(currency, to_currency, amount)
    @currency = currency
    @to_currency = to_currency
    @amount = amount
  end

  def call
    query = "#{currency}_#{to_currency}"
    query2 = "#{to_currency}_#{currency}"
    request = RestClient.get("https://free.currconv.com/api/v7/convert?q=#{query},#{query2}&compact=ultra&apiKey=b6250a2ecebb9fe8c908")
    JSON.parse(request)
  end
end
