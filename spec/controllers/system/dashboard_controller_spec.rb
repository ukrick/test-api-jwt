require 'rails_helper'

RSpec.describe System::DashboardController, type: :controller do
  include ApiHelper

  describe "GET /index" do
    context 'with valid Authorization header' do
      let!(:user) { User.create!(email: 'test@test.com', password: 'password') }

      before do
        authenticated_header(request, user)
        get :index
      end

      it 'response should be 200' do
        expect(response).to have_http_status(:ok)
      end
    end

    context 'with invalid Authorization header' do
      before do
        get :index
      end

      it 'response should be 401' do
        expect(response).to have_http_status(401)
      end
    end
  end
end
