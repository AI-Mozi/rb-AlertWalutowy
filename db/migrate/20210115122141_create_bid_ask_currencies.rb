class CreateBidAskCurrencies < ActiveRecord::Migration[5.2]
  def change
    create_table :bid_ask_currencies do |t|
      t.references :currency, foreign_key: true
      t.decimal :bid
      t.decimal :ask

      t.timestamps
    end
  end
end
