class LoggedUserController < ApplicationController
  before_action :require_login

  def index
    @past_currencies = current_user.currency_histories.group_by(&:currency_id)
    @posts = LoggedUserChartService.call(@past_currencies)
  end

  private

  def require_login
    redirect_to(new_user_session_url) unless current_user
  end
end
