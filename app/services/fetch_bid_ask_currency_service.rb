class FetchBidAskCurrencyService < ApplicationService
  def call
    @bid_request = RestClient.get("https://api.nbp.pl/api/exchangerates/tables/C/")
    @bid_rates = JSON.parse(@bid_request).first["rates"]

    @bid_rates.each do |each_rate|
      bid_currency = Currency.find_by(name: each_rate['currency'])

      @find_bid_currency = BidAskCurrency.find_by(currency_id: bid_currency.id)

      if find_bid_currency.present?
        find_bid_currency.update(ask: each_rate['ask'], bid: each_rate['bid'])
      else
        @new_currency = BidAskCurrency.create(ask: each_rate['ask'], bid: each_rate['bid'], currency_id: bid_currency.id)
      end
    end
  end
end
