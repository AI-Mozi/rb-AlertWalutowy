class LoggedUserController < ApplicationController
  before_action :require_login

  def index
    @past_currencies = current_user.currency_histories.group_by(&:currency_id)
    @posts = []
    @past_currencies.each do |past|
      @post = {}
      @post[:id] = past[0]
      @post[:min] = past[1].pluck(:mid).min
      @post[:max] = past[1].pluck(:mid).max
      @post[:chart] = past[1].pluck(:day, :mid)
      @post[:avg] = (@post[:max] - @post[:min]).abs
      @post[:name] = Currency.find(past[0]).name.upcase
      @posts.append(@post)
    end
  end

  private

  def require_login
    redirect_to(new_user_session_url) unless current_user
  end
end
