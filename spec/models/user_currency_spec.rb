require 'rails_helper'

RSpec.describe UserCurrency, :type => :model do
  subject{
    described_class.new(id: 1,
                        user_id: 1,
                        currency_id: 1,
                        purchase: 2.3,
                        sale: 2.5)
  }
  let(:user) { create(:user) }
  let(:currency) { create(:currency) }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:currency) }
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
  end
end
