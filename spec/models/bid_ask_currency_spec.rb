require 'rails_helper'

RSpec.describe BidAskCurrency, :type => :model do
  let(:currency) { create(:currency) }
  subject{
    described_class.new(id: 1,
                        currency_id: currency.id,
                        bid: 2.3,
                        ask: 2.2)
  }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

   it { should validate_presence_of(:bid) }
   it { should validate_presence_of(:ask) }
  end

  describe 'associations' do
    it { should belong_to(:currency) }
    it { should have_many(:users).through(:user_currencies) }
  end
end
