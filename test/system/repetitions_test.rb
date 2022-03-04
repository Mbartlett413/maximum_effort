require "application_system_test_case"

class RepetitionsTest < ApplicationSystemTestCase
  setup do
    @repetition = repetitions(:one)
  end

  test "visiting the index" do
    visit repetitions_url
    assert_selector "h1", text: "Repetitions"
  end

  test "creating a Repetition" do
    visit repetitions_url
    click_on "New Repetition"

    fill_in "Title", with: @repetition.title
    fill_in "User", with: @repetition.user_id
    click_on "Create Repetition"

    assert_text "Repetition was successfully created"
    click_on "Back"
  end

  test "updating a Repetition" do
    visit repetitions_url
    click_on "Edit", match: :first

    fill_in "Title", with: @repetition.title
    fill_in "User", with: @repetition.user_id
    click_on "Update Repetition"

    assert_text "Repetition was successfully updated"
    click_on "Back"
  end

  test "destroying a Repetition" do
    visit repetitions_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repetition was successfully destroyed"
  end
end
