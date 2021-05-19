class BidAskCurrency < ApplicationRecord
  belongs_to :currency
  has_many :user_currrencies
  has_many :users, through: :user_currencies

  validates_presence_of :bid, :ask
end
