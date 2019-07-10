require "application_system_test_case"

class EntreprisesTest < ApplicationSystemTestCase
  setup do
    @entreprise = entreprises(:one)
  end

  test "visiting the index" do
    visit entreprises_url
    assert_selector "h1", text: "Entreprises"
  end

  test "creating a Entreprise" do
    visit entreprises_url
    click_on "New Entreprise"

    fill_in "Adress", with: @entreprise.adress
    fill_in "Description", with: @entreprise.description
    fill_in "Langague", with: @entreprise.langague
    fill_in "Name", with: @entreprise.name
    click_on "Create Entreprise"

    assert_text "Entreprise was successfully created"
    click_on "Back"
  end

  test "updating a Entreprise" do
    visit entreprises_url
    click_on "Edit", match: :first

    fill_in "Adress", with: @entreprise.adress
    fill_in "Description", with: @entreprise.description
    fill_in "Langague", with: @entreprise.langague
    fill_in "Name", with: @entreprise.name
    click_on "Update Entreprise"

    assert_text "Entreprise was successfully updated"
    click_on "Back"
  end

  test "destroying a Entreprise" do
    visit entreprises_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Entreprise was successfully destroyed"
  end
end
