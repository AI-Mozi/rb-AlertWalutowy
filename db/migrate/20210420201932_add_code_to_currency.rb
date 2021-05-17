class AddCodeToCurrency < ActiveRecord::Migration[5.2]
  def change
    add_column(:currencies, :code, :string)
  end
end
