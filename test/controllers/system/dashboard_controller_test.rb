require "test_helper"

class System::DashboardControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get system_dashboard_url
    assert_response :success
  end
end
