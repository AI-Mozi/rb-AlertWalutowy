require 'rails_helper'

RSpec.describe Currency, :type => :model do
  describe 'validations' do
    let(:currency) { create(:currency) }

    it 'is valid with valit attributes' do
      expect(currency).to be_valid
    end

    it { should validate_uniqueness_of(:name) }
    it { should validate_uniqueness_of(:code) }
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:code) }
    it { should validate_presence_of(:value) }
  end

  describe 'associations' do
    it { should have_many(:user_currencies) }
    it { should have_many(:currency_histories) }
    it { should have_many(:bid_ask_currencies) }
    it { should have_many(:users).through(:user_currencies) }
  end
end
