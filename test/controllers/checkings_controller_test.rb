require 'test_helper'

class CheckingsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get checkings_create_url
    assert_response :success
  end

end
