require "application_system_test_case"

class DummyRepetitionCollectionsTest < ApplicationSystemTestCase
  setup do
    @dummy_repetition_collection = dummy_repetition_collections(:one)
  end

  test "visiting the index" do
    visit dummy_repetition_collections_url
    assert_selector "h1", text: "Dummy Repetition Collections"
  end

  test "creating a Dummy repetition collection" do
    visit dummy_repetition_collections_url
    click_on "New Dummy Repetition Collection"

    fill_in "Dummy repetition", with: @dummy_repetition_collection.dummy_repetition_id
    check "Percent based" if @dummy_repetition_collection.percent_based
    fill_in "Rep value", with: @dummy_repetition_collection.rep_value
    fill_in "Set value", with: @dummy_repetition_collection.set_value
    click_on "Create Dummy repetition collection"

    assert_text "Dummy repetition collection was successfully created"
    click_on "Back"
  end

  test "updating a Dummy repetition collection" do
    visit dummy_repetition_collections_url
    click_on "Edit", match: :first

    fill_in "Dummy repetition", with: @dummy_repetition_collection.dummy_repetition_id
    check "Percent based" if @dummy_repetition_collection.percent_based
    fill_in "Rep value", with: @dummy_repetition_collection.rep_value
    fill_in "Set value", with: @dummy_repetition_collection.set_value
    click_on "Update Dummy repetition collection"

    assert_text "Dummy repetition collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Dummy repetition collection" do
    visit dummy_repetition_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dummy repetition collection was successfully destroyed"
  end
end
