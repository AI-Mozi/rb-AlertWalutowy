class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_many :user_currencies
  has_many :currencies, through: :user_currencies
  has_many :currency_histories, through: :currencies
end
