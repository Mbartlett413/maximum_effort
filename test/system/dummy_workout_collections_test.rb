require "application_system_test_case"

class DummyWorkoutCollectionsTest < ApplicationSystemTestCase
  setup do
    @dummy_workout_collection = dummy_workout_collections(:one)
  end

  test "visiting the index" do
    visit dummy_workout_collections_url
    assert_selector "h1", text: "Dummy Workout Collections"
  end

  test "creating a Dummy workout collection" do
    visit dummy_workout_collections_url
    click_on "New Dummy Workout Collection"

    fill_in "Dummy repetition", with: @dummy_workout_collection.dummy_repetition_id
    fill_in "Exercise", with: @dummy_workout_collection.exercise_id
    click_on "Create Dummy workout collection"

    assert_text "Dummy workout collection was successfully created"
    click_on "Back"
  end

  test "updating a Dummy workout collection" do
    visit dummy_workout_collections_url
    click_on "Edit", match: :first

    fill_in "Dummy repetition", with: @dummy_workout_collection.dummy_repetition_id
    fill_in "Exercise", with: @dummy_workout_collection.exercise_id
    click_on "Update Dummy workout collection"

    assert_text "Dummy workout collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Dummy workout collection" do
    visit dummy_workout_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dummy workout collection was successfully destroyed"
  end
end
