require 'rails_helper'

RSpec.describe Users::RegistrationsController, type: :request do
  describe "POST /create" do
    context 'with valid Authorization parameters' do
      it 'response should be 200' do
        headers = { 'ACCEPT': 'application/json', 'Content-Type': 'application/json' }
        post '/signup', params: {
          user: {
            email: 'test@test.com',
            password: 'password'
          }
        }, as: :json, headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
