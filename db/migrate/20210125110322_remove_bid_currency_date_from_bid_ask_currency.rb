class RemoveBidCurrencyDateFromBidAskCurrency < ActiveRecord::Migration[5.2]
  def change
    remove_column :bid_ask_currencies, :bid_currency_date, :date
  end
end
