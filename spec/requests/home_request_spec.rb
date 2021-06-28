require 'rails_helper'

RSpec.describe 'Home', type: :request do
  describe 'GET /index' do
    it 'renders a successful response' do
      get '/'
      expect(response).to have_http_status(200)
    end
  end
end
