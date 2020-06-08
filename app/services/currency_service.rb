class CurrencyService < ApplicationService
  def call
    @request = RestClient.get("https://api.nbp.pl/api/exchangerates/tables/A/")
    @rates = JSON.parse(@request).first["rates"]

    @rates.each do |value|  
      
      find_currency = Currency.find_by(name: value['currency'])

      if find_currency.present?
        find_currency.update(name: value['currency'], value: value['mid'])        
      else 
        @new_currency = Currency.create(name: value['currency'], value: value['mid'])       
      end    
    end
  end
end
