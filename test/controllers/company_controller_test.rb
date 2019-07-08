require 'test_helper'

class CompanyControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard01" do
    get company_dashboard01_url
    assert_response :success
  end

  test "should get dashboard02" do
    get company_dashboard02_url
    assert_response :success
  end

end
