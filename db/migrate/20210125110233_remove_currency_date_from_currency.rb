class RemoveCurrencyDateFromCurrency < ActiveRecord::Migration[5.2]
  def change
    remove_column :currencies, :currency_date, :date
  end
end
