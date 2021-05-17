class UserCurrencyController < ApplicationController
  before_action :require_login

  def new
    @user_currency = UserCurrency.new
  end

  def create
    if params[:user].nil?
      current_user.user_currencies.destroy_all
      redirect_to(logged_user_index_path)
    else
      UserCurrencyManager.new(params[:user][:currency_ids], current_user).call
      redirect_to(logged_user_index_path)
    end
  end

  private

  def require_login
    redirect_to(new_user_session_url) unless current_user
  end
end
