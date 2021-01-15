class UserCurrencyController < ApplicationController
  before_action :require_login

  def new
    @user_currency = UserCurrency.new()
  end
  
  def create
    UserCurrencyManager.new(params[:user][:currency_ids], current_user).call
    redirect_to logged_user_index_path
  end
  
  private

  def user_currency_params
    params.permit(:user_id,  currency_id:[])
  end
  
  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
