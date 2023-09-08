require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  pending describe 'GET /index' do
    it 'returns http success' do
      get '/public_recipes/index'
      expect(response).to have_http_status(:success)
    end
  end
end
