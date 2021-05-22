class User < ApplicationRecord
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :confirmable

  has_many :user_currencies, dependent: :destroy
  has_many :currencies, through: :user_currencies
  has_many :currency_histories, through: :currencies
  has_many :bid_ask_currencies, through: :user_currencies

  validates_uniqueness_of :nick, :email
  validates_presence_of :nick, :email, :password

  validates_length_of :nick, minimum: 4, maximum: 10
end
