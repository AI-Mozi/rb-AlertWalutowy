class UserCurrency < ApplicationRecord
  belongs_to :user
  belongs_to :currency
  has_many :bid_ask_currencies

  validates_presence_of :user, :currency
end
