class AddValueToCurrencies < ActiveRecord::Migration[5.2]
  def change
    add_column :currencies, :value, :decimal 
  end
end
