require 'test_helper'

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get experiences_destroy_url
    assert_response :success
  end

end
