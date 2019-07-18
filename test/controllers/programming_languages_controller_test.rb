require 'test_helper'

class ProgrammingLanguagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get programming_languages_create_url
    assert_response :success
  end

  test "should get update" do
    get programming_languages_update_url
    assert_response :success
  end

  test "should get destroy" do
    get programming_languages_destroy_url
    assert_response :success
  end

end
