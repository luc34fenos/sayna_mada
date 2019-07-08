require 'test_helper'

class EntreprisesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @entreprise = entreprises(:one)
  end

  test "should get index" do
    get entreprises_url
    assert_response :success
  end

  test "should get new" do
    get new_entreprise_url
    assert_response :success
  end

  test "should create entreprise" do
    assert_difference('Entreprise.count') do
      post entreprises_url, params: { entreprise: { adress: @entreprise.adress, description: @entreprise.description, langague: @entreprise.langague, name: @entreprise.name } }
    end

    assert_redirected_to entreprise_url(Entreprise.last)
  end

  test "should show entreprise" do
    get entreprise_url(@entreprise)
    assert_response :success
  end

  test "should get edit" do
    get edit_entreprise_url(@entreprise)
    assert_response :success
  end

  test "should update entreprise" do
    patch entreprise_url(@entreprise), params: { entreprise: { adress: @entreprise.adress, description: @entreprise.description, langague: @entreprise.langague, name: @entreprise.name } }
    assert_redirected_to entreprise_url(@entreprise)
  end

  test "should destroy entreprise" do
    assert_difference('Entreprise.count', -1) do
      delete entreprise_url(@entreprise)
    end

    assert_redirected_to entreprises_url
  end
end
