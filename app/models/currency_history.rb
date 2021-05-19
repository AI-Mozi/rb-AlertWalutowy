class CurrencyHistory < ApplicationRecord
  has_many :user_currencies
  has_many :users, through: :user_currencies
  belongs_to :currency

  validates_presence_of :day, :mid
end
