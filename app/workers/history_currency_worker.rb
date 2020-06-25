class HistoryCurrencyWorker
  include Sidekiq::Worker

  def perform
    @end_date = Time.now.strftime("%Y-%m-%d")
    @start_date = (Time.now - 10.days).strftime("%Y-%m-%d")
    FetchCurrencyHistoryService.call(@start_date, @end_date)
  end
end
