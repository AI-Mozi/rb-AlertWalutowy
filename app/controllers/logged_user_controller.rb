class LoggedUserController < ApplicationController
  before_action :require_login

  def index
    @past_currencies = current_user.currency_histories.group_by(&:currency_id)
    @add_purchase_and_sale = current_user.user_currencies.find_by(currency_id: params[:id])
    binding.pry
  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
