class BidAskCurrencyController < ApplicationController
  before_action :require_login
  
  def edit
    @add_purchase_and_sale = current_user.user_currencies.find_by(currency_id: params[:id])
    @currency_name = @add_purchase_and_sale.currency.name.upcase
  end

  def update
    @add_purchase_and_sale = current_user.user_currencies.find_by(currency_id: params[:id])

    respond_to do |format|
      if @add_purchase_and_sale.update(bid_ask_currency_params)
        format.html { redirect_to logged_user_index_path, notice: 'Value was successfully saved' }
      else
        format.html { render :edit }
      end
    end

  end

  private

  def bid_ask_currency_params
    params.require(:user_currency).permit(:purchase, :sale)
  end
  
  def require_login
    unless current_user
      redirect_to new_user_session_url
    end
  end
end
