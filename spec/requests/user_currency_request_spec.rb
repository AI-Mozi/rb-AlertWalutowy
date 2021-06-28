require 'rails_helper'
require 'pry'
require_relative '../support/controller_macros'


RSpec.describe 'UserCurrency', type: :request do
  login_user

  it 'redirected if not logged in' do
    sign_out @user
    get new_user_session_url
  end

  describe 'GET /new' do
    it 'renders a successful new template' do
      get new_user_currency_path
      binding.pry
      expect(response).to render_template('new')
    end

    it 'does not render a different template' do
      get new_user_currency_path
      expect(response).to_not render_template(:show)
    end
  end

  describe 'GET /edit' do
  end
end
