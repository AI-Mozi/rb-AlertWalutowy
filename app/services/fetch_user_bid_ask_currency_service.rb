require 'pry'
class FetchUserBidAskCurrencyService < ApplicationService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def call
    @user_currencies_service = user.user_currencies
  
    @user_currencies_service.each do |ucs|
      buy_sell_currency = BidAskCurrency.find_by(currency_id: ucs['currency_id'])
        
      if(ucs['purchase'] == buy_sell_currency['bid'])
        #BidAskMailer.send_bid_ask_email(@user)
        p "tak"
      else
        p "nie"
      end
    end
  end
end