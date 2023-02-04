require 'rails_helper'

RSpec.describe Users::SessionsController, type: :request do

  describe "POST /create" do
    let!(:user) { User.create!(email: 'test@test.com', password: 'password') }

    context 'with valid Authorization parameters' do
      it 'response should be 200' do
        headers = { 'Content-Type': 'application/json; charset=utf-8' }
        post '/login', params: {
          user: {
            email: 'test@test.com',
            password: 'password'
          }
        }, as: :json, headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid Authorization parameters' do
      it 'response should be 401' do
        headers = { 'Content-Type': 'application/json; charset=utf-8' }
        post '/login', params: {
          user: {
            email: 'test@test.com',
            password: ''
          }
        }, as: :json, headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(401)
      end
    end
  end

  describe "DELETE /destroy" do
    let!(:user) { User.create!(email: 'test@test.com', password: 'password') }

    context 'with valid Authorization parameters' do
      it 'response should be 200' do
        headers = { 'Content-Type': 'application/json; charset=utf-8' }
        post '/login', params: {
          user: {
            email: 'test@test.com',
            password: 'password'
          }
        }, as: :json, headers: headers

        headers = headers.merge({ 'Authorization': response.headers["Authorization"] })
        delete '/logout', headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid Authorization parameters' do
      it 'response should be 401' do
        headers = { 'Content-Type': 'application/json; charset=utf-8', 'Authorization': '' }
        delete '/logout', headers: headers

        expect(response.content_type).to eq('application/json; charset=utf-8')
        expect(response).to have_http_status(401)
      end
    end
  end
end
