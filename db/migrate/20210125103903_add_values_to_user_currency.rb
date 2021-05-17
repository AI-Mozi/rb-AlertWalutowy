# frozen_string_literal: true

class AddValuesToUserCurrency < ActiveRecord::Migration[5.2]
  def change
    add_column(:user_currencies, :purchase, :decimal)
    add_column(:user_currencies, :sale, :decimal)
  end
end
