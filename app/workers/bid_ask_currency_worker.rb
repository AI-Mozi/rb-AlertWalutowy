class BidAskCurrencyWorker
  include Sidekiq::Worker

  def perform
    FetchBidAskCurrencyService.call
  end
end
