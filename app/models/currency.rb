class Currency < ApplicationRecord
  has_many :user_currencies
  has_many :users, through: :user_currencies
  has_many :currency_histories
  has_many :bid_ask_currencies
end