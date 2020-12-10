class UserCurrencyController < ApplicationController
  
    def new
      @user_currency = UserCurrency.new()
      @user = current_user      
    end
  
    def create
      UserCurrencyManager.new(params[:user][:currency_ids], current_user).run
      redirect_to logged_user_index_path
    end
  
    private
    def user_currency_params
      params.permit(:user_id,  currency_id:[])
    end
   
end
