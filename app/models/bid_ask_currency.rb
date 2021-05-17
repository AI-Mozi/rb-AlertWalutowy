class BidAskCurrency < ApplicationRecord
  belongs_to :currency
  has_many :user_currrencies
  has_many :users, through: :user_currrencies
end
