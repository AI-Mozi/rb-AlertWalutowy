class GoldWorker
  include Sidekiq::Worker

  def perform
    FetchGoldService.call
  end
end
