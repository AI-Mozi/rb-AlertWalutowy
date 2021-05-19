require 'rails_helper'

RSpec.describe BidAskCurrency, :type => :model do
  subject{
    described_class.new(id: 1,
                        currency_id: 1,
                        bid: 2.3,
                        ask: 2.2)
  }
  let(:currency) { create(:currency) }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a bid' do
      subject.bid = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a ask' do
      subject.ask = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:currency) }
  end
end
