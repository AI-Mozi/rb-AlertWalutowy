# frozen_string_literal: true

class AddNickToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column(:users, :nick, :string)
    add_index(:users, :nick, unique: true)
  end
end
