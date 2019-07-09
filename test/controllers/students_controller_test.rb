require 'test_helper'

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard1" do
    get students_dashboard1_url
    assert_response :success
  end

  test "should get dashboard2" do
    get students_dashboard2_url
    assert_response :success
  end

end
