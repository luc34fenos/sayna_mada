require 'test_helper'

class BackgroundsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get backgrounds_create_url
    assert_response :success
  end

  test "should get update" do
    get backgrounds_update_url
    assert_response :success
  end

  test "should get destroy" do
    get backgrounds_destroy_url
    assert_response :success
  end

end
