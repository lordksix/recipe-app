require 'rails_helper'

RSpec.describe 'RecipeFoods', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/recipe_foods/index'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/recipe_foods/destroy'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/recipe_foods/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/recipe_foods/edit'
      expect(response).to have_http_status(:success)
    end
  end
end
