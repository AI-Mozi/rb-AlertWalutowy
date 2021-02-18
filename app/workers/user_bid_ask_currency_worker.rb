class UserBidAskCurrencyWorker
  include Sidekiq::Worker

  def perform
    User.all.each do |user|
      FetchUserBidAskCurrencyService.call(user)
    end  
  end
end
