require 'rails_helper'

RSpec.describe User, :type => :model do
  let(:user) { create(:user) }

  describe 'validations' do
    it 'is valid with valid attributes' do
      expect(user).to be_valid
    end

    it 'is not valid if nick is shorter than 4 characters' do
      user.nick = "asd"
      expect(user).to_not be_valid
    end

    it 'is not valid if nick is logner than 10 characters' do
      user.nick = "asdfghjklzx"
      expect(user).to_not be_valid
    end

    it { should validate_presence_of(:email)}
    it { should validate_presence_of(:password)}
    it { should validate_presence_of(:nick)}
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should validate_uniqueness_of(:nick) }
  end

  describe 'associations' do
    it { should have_many(:user_currencies).dependent(:destroy) }
    it { should have_many(:currencies).through(:user_currencies) }
    it { should have_many(:currency_histories).through(:currencies) }
    it { should have_many(:bid_ask_currencies).through(:user_currencies) }
  end
end
