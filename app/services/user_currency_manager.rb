class UserCurrencyManager
  attr_reader :currency_ids, :user

  def initialize(currency_ids, user)
    @currency_ids = currency_ids
    @user = user
  end

  def clean_currencies
    currency_ids.reject { |id| id == "" }
  end

  def checked_currencies
    clean_currencies.map { |id| Currency.find(id) }
  end

  def unchecked_currencies
    Currency.all.reject { |currency| checked_currencies.include?(currency) }
  end

  def create_user_currency_from_checked_currencies
    checked_currencies.each do |currency|
      UserCurrency.find_or_create_by(currency: currency, user: user)
    end
  end

  def destroy_user_currency_from_unchecked_currencies
    unchecked_currencies.each do |currency|
      user_currency = UserCurrency.find_by(currency: currency, user: user)
      user_currency.destroy if user_currency
    end
  end

  def run
    create_user_currency_from_checked_currencies
    destroy_user_currency_from_unchecked_currencies
  end
end