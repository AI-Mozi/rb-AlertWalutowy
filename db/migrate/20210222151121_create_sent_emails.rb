class CreateSentEmails < ActiveRecord::Migration[5.2]
  def change
    create_table :sent_emails do |t|
      t.references :user, foreign_key: true
      t.references :currency, foreign_key: true
      t.string :type
      t.decimal :value

      t.timestamps
    end
  end
end
