require 'rails_helper'

RSpec.describe UserCurrency, :type => :model do
  let(:user) { create(:user) }
  let(:currency) { create(:currency) }
  subject{
    described_class.new(id: 1,
                        user_id: user.id,
                        currency_id: currency.id,
                        purchase: 2.3,
                        sale: 2.5)
  }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:user) }
    it { should validate_presence_of(:currency) }
    it { should allow_value(nil).for(:purchase)}
    it { should allow_value(nil).for(:sale)}
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:currency) }
    #t { should have_many(:bid_ask_currencies) }
  end
end
