class CreateCurrencyHistories < ActiveRecord::Migration[5.2]
  def change
    create_table :currency_histories do |t|
      t.references :currency
      t.decimal :mid
      t.date :day

      t.timestamps
    end
  end
end
