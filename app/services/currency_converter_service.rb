require 'pry'
class CurrencyConverterService < ApplicationService
  attr_accessor :currency, :to_currency, :amount

  def initialize(currency, to_currency, amount)
    @currency = currency
    @to_currency = to_currency
    @amount = amount
  end

  def call
    query = "#{currency}_#{to_currency}"
    request = RestClient.get("https://free.currconv.com/api/v7/convert?q=#{query}&compact=ultra&apiKey=#{api_key}")
    json = JSON.parse(request)
    json[query]
  end

  private

  def api_key
    ENV['CONVERTER_API']
  end
end
