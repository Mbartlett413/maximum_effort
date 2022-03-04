require "application_system_test_case"

class RepetitionCollectionsTest < ApplicationSystemTestCase
  setup do
    @repetition_collection = repetition_collections(:one)
  end

  test "visiting the index" do
    visit repetition_collections_url
    assert_selector "h1", text: "Repetition Collections"
  end

  test "creating a Repetition collection" do
    visit repetition_collections_url
    click_on "New Repetition Collection"

    check "Percent based" if @repetition_collection.percent_based
    fill_in "Rep value", with: @repetition_collection.rep_value
    fill_in "Repetition", with: @repetition_collection.repetition_id
    fill_in "Set value", with: @repetition_collection.set_value
    click_on "Create Repetition collection"

    assert_text "Repetition collection was successfully created"
    click_on "Back"
  end

  test "updating a Repetition collection" do
    visit repetition_collections_url
    click_on "Edit", match: :first

    check "Percent based" if @repetition_collection.percent_based
    fill_in "Rep value", with: @repetition_collection.rep_value
    fill_in "Repetition", with: @repetition_collection.repetition_id
    fill_in "Set value", with: @repetition_collection.set_value
    click_on "Update Repetition collection"

    assert_text "Repetition collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Repetition collection" do
    visit repetition_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Repetition collection was successfully destroyed"
  end
end
