require 'rails_helper'

RSpec.describe SentEmail, :type => :model do
  subject{
    described_class.new(user_id: 1,
                        currency_id: 1,
                        operation_type: "purchase",
                        value: 3.3)
  }
  let(:currency) { create(:currency) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:operation_type) }
    it { should validate_presence_of(:value) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
  end
end
