require 'rails_helper'

RSpec.describe 'StaticPages', type: :request do
  describe 'GET /quiz' do
    it 'returns http success' do
      get '/static_pages/quiz'
      expect(response).to have_http_status(:success)
    end
  end
end
