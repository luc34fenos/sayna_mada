require 'test_helper'

class SwebsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get swebs_create_url
    assert_response :success
  end

  test "should get update" do
    get swebs_update_url
    assert_response :success
  end

  test "should get destroy" do
    get swebs_destroy_url
    assert_response :success
  end

end
