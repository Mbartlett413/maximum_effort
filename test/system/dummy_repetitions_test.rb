require "application_system_test_case"

class DummyRepetitionsTest < ApplicationSystemTestCase
  setup do
    @dummy_repetition = dummy_repetitions(:one)
  end

  test "visiting the index" do
    visit dummy_repetitions_url
    assert_selector "h1", text: "Dummy Repetitions"
  end

  test "creating a Dummy repetition" do
    visit dummy_repetitions_url
    click_on "New Dummy Repetition"

    fill_in "Title", with: @dummy_repetition.title
    click_on "Create Dummy repetition"

    assert_text "Dummy repetition was successfully created"
    click_on "Back"
  end

  test "updating a Dummy repetition" do
    visit dummy_repetitions_url
    click_on "Edit", match: :first

    fill_in "Title", with: @dummy_repetition.title
    click_on "Update Dummy repetition"

    assert_text "Dummy repetition was successfully updated"
    click_on "Back"
  end

  test "destroying a Dummy repetition" do
    visit dummy_repetitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dummy repetition was successfully destroyed"
  end
end
