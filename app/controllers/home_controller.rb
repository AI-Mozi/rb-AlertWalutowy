class HomeController < ApplicationController
  def index    
     @currency = Currency.all  
  end
end
