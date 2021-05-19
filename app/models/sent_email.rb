class SentEmail < ApplicationRecord
  belongs_to :user
  belongs_to :currency

  validates_presence_of :operation_type, :value
end
