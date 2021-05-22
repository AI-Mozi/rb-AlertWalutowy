require 'rails_helper'

RSpec.describe CurrencyHistory, :type => :model do
  let(:currency) { create(:currency) }
  subject{
    described_class.new(id: 1,
                        currency_id: currency.id,
                        mid: 2.3,
                        day: "2021-02-09")
  }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

    it { should validate_presence_of(:day)}
    it { should validate_presence_of(:mid)}
  end

  describe 'associations' do
    it { should belong_to(:currency) }
    it { should have_many(:users).through(:user_currencies) }
  end
end
