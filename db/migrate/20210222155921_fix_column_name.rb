class FixColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :sent_emails, :type, :operation_type
  end
end
