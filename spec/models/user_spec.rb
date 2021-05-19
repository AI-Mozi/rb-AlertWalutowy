require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:nick)}
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:nick) }
  end

  describe 'associations' do
    it { expect(user).to have_many(:user_currencies).dependent(:destroy) }
    it { expect(user).to have_many(:currencies).through(:user_currencies) }
    it { expect(user).to have_many(:currency_histories).through(:currencies) }
    it { expect(user).to have_many(:bid_ask_currencies).through(:user_currencies) }
  end
end
