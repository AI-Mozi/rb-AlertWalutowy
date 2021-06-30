class LoggedUserController < ApplicationController
  include LoggedUserHelper
  before_action :require_login

  def index
    @past_currencies = current_user.currency_histories.group_by(&:currency_id)
    @logged_user_currencies = helpers.logged_user_chart_data(@past_currencies)
    parametr = params[:id].to_i

    if params[:id].present?
      @logged_user_currencies.each do |c|
        @displayed_currency = c if c[:id] == parametr
      end
    else
      @displayed_currency = @logged_user_currencies.first
    end
  end

  private

  def require_login
    redirect_to(new_user_session_url) unless current_user
  end
end
