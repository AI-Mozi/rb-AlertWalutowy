require 'pry'
class BidAskCurrencyController < ApplicationController
  def edit
    @add_purchase_and_sale = current_user.user_currencies.find_by(currency_id: params[:id])
    @currency_name = @add_purchase_and_sale.currency.name.upcase
  end

  def update
    @add_purchase_and_sale = current_user.user_currencies.find_by(currency_id: params[:id])
    if @add_purchase_and_sale.update(bid_ask_currency_params)
      redirect_to logged_user_index_path
    else
      render edit
    end

  end

  private

  def bid_ask_currency_params
    params.require(:user_currency).permit(:purchase, :sale)
  end
end
