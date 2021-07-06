class PdfGeneratorService < ApplicationService
  attr_reader :code, :from_date, :to_date

  def initialize(code, from_date, to_date)
    @code = code
    @from_date = from_date
    @to_date = to_date
  end

  def call
    begin
      currencies = RestClient.get("http://api.nbp.pl/api/exchangerates/rates/A/#{code}/#{from_date}/#{to_date}/")
      parser_currencies = JSON.parse(currencies)
    rescue RestClient::NotFound => e
      e.message
    end
  end
end