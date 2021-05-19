require 'rails_helper'

RSpec.describe CurrencyHistory, :type => :model do
  subject{
    described_class.new(id: 1,
                        currency_id: 1,
                        mid: 2.3,
                        day: "2021-02-09")
  }
  let(:currency) { create(:currency) }

  describe 'validations' do
    it 'is valid with valit attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a mid' do
      subject.mid = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a day' do
      subject.day = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'associations' do
    it { should belong_to(:currency) }
  end
end
