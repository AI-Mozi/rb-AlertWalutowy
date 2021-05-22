class BidAskCurrency < ApplicationRecord
  belongs_to :currency
  has_many :user_currencies
  has_many :users, through: :user_currencies

  validates_presence_of :bid, :ask
end
