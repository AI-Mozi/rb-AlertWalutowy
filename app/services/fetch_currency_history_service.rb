class FetchCurrencyHistoryService < ApplicationService
    
  attr_accessor :start_date, :end_date
  
  def initialize(start_date, end_date)
     @start_date = start_date
    @end_date = end_date
  end
  def call
    CurrencyHistory.where('day < ?', 10.days.ago).delete_all

    @history_request = RestClient.get("http://api.nbp.pl/api/exchangerates/tables/A/#{start_date}/#{end_date}")

    JSON.parse(@history_request).each do |days|

      history_date = days['effectiveDate']
      value_list = days['rates']

      value_list.each do |v|
        currency = Currency.find_by(name: v['currency'])
                
        unless CurrencyHistory.find_by(day: history_date , currency_id: currency.id)
                    
          CurrencyHistory.create(day: history_date, mid: v['mid'], currency_id: currency.id)
                    
        end        
      end
    end  
  end
end
