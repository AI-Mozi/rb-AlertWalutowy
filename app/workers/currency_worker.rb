class CurrencyWorker
  include Sidekiq::Worker

  def perform()
    CurrencyService.call
  end
end
