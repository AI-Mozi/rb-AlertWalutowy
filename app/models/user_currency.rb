class UserCurrency < ApplicationRecord
  belongs_to :user
  belongs_to :currency
  belongs_to :currency_history
end
