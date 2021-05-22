class SentEmail < ApplicationRecord
  belongs_to :user
  belongs_to :currency

  enum operation_type: %w(purchase sale)
  validates_presence_of :operation_type, :value
end
