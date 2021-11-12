require "test_helper"

class PinsControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get pins_home_url
    assert_response :success
  end
end
