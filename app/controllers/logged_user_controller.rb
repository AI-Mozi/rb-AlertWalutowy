class LoggedUserController < ApplicationController
  before_action :require_login

  def index
    @past_currencies = current_user.currency_histories.group_by(&:currency_id)
  end

  private

  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
