class System::DashboardController < ApplicationController
  before_action :authenticate_user!

  def index
    render json: {
      message: "Welcome to system, #{current_user.email}. Your have a correct token"
    }
  end
end
