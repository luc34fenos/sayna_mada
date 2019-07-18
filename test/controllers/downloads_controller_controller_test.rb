require 'test_helper'

class DownloadsControllerControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get downloads_controller_show_url
    assert_response :success
  end

  test "should get cv_pdf" do
    get downloads_controller_cv_pdf_url
    assert_response :success
  end

  test "should get send_cv_pdf" do
    get downloads_controller_send_cv_pdf_url
    assert_response :success
  end

end
