require 'rails_helper'

RSpec.describe 'Deals', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/deals/new'
      expect(response).to have_http_status(:success)
    end
  end
end
