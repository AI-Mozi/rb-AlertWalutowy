class FetchUserBidAskCurrencyService < ApplicationService
  attr_accessor :user

  def initialize(user)
    @user = user
  end

  def call
    @user_currencies_service = user.user_currencies

    @user_currencies_service.each do |ucs|
      buy_sell_currency = BidAskCurrency.find_by(currency_id: ucs['currency_id'])
      next unless buy_sell_currency && ucs['purchase'].present?

      @currency_name = buy_sell_currency.currency.name
      @currency_bid = buy_sell_currency.bid
      @currency_ask = buy_sell_currency.ask

      # Checking purchase value
      if buy_sell_currency['bid'] <= ucs['purchase']
        @bid = SentEmail.find_by(
          user_id: user.id,
          currency_id: buy_sell_currency.currency_id,
          operation_type: 'purchase'
        )

        if @bid.present? && @bid.value > ucs['purchase']
          @bid.update(
            user_id: user.id,
            currency_id: buy_sell_currency.currency_id,
            operation_type: 'purchase',
            value: ucs['purchase']
          )
        else
          SentEmail.create(
            user_id: user.id,
            currency_id: buy_sell_currency.currency_id,
            operation_type: 'purchase',
            value: ucs['purchase']
          )
        end

        BidAskMailer.send_bid_email(@user, @currency_name, @currency_bid).deliver_now!
      end

      # Checking sale value
      next unless buy_sell_currency['ask'] >= ucs['sale']

      @ask = SentEmail.find_by(
        user_id: user.id,
        currency_id: buy_sell_currency.currency_id,
        operation_type: 'sale'
      )

      if @ask.present? && @ask.value < ucs['sale']
        @ask.update(
          user_id: user.id,
          currency_id: buy_sell_currency.currency_id,
          operation_type: 'sale',
          value: ucs['sale']
        )
      else
        SentEmail.create(
          user_id: user.id,
          currency_id: buy_sell_currency.currency_id,
          operation_type: 'sale',
          value: ucs['sale']
        )
      end

      BidAskMailer.send_ask_email(@user, @currency_name, @currency_ask).deliver_now!
    end
  end
end
