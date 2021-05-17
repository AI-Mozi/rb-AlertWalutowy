class UserCurrencyManager
  attr_reader :currency_ids, :user

  def initialize(currency_ids, user)
    @currency_ids = currency_ids
    @user = user
  end

  def call
    create_user_currency_from_checked_currencies
    destroy_user_currency_from_unchecked_currencies
  end

  private

  def clean_currencies
    currency_ids.reject(&:blank?)
  end

  def checked_currencies
    Currency.where(id: clean_currencies)
  end

  def unchecked_currencies
    Currency.where.not(id: checked_currencies.pluck(:id))
  end

  def create_user_currency_from_checked_currencies
    checked_currencies.each do |currency|
      UserCurrency.find_or_create_by(currency: currency, user: user)
    end
  end

  def destroy_user_currency_from_unchecked_currencies
    unchecked_currencies.each do |currency|
      user_currency = UserCurrency.find_by(currency: currency, user: user)
      user_currency&.destroy
    end
  end
end
