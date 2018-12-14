require 'test_helper'

class Api::V1ControllerTest < ActionDispatch::IntegrationTest
  test "should get income_resources" do
    get api_v1_income_resources_url
    assert_response :success
  end

end
