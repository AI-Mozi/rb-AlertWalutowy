class FetchGoldService < ApplicationService
  def call
    gold_request = RestClient.get('http://api.nbp.pl/api/cenyzlota/')
    parsed_gold = JSON.parse(gold_request)

    last_gold = Gold.last

    if last_gold
      last_gold.update(date: parsed_gold.first['data'], price: parsed_gold.first['cena'])
    else
      Gold.create(date: parsed_gold.first['data'], price: parsed_gold.first['cena'])
    end
  end
end