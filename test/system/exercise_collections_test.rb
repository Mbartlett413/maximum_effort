require "application_system_test_case"

class ExerciseCollectionsTest < ApplicationSystemTestCase
  setup do
    @exercise_collection = exercise_collections(:one)
  end

  test "visiting the index" do
    visit exercise_collections_url
    assert_selector "h1", text: "Exercise Collections"
  end

  test "creating a Exercise collection" do
    visit exercise_collections_url
    click_on "New Exercise Collection"

    fill_in "Program workout", with: @exercise_collection.program_workout_id
    fill_in "Title", with: @exercise_collection.title
    click_on "Create Exercise collection"

    assert_text "Exercise collection was successfully created"
    click_on "Back"
  end

  test "updating a Exercise collection" do
    visit exercise_collections_url
    click_on "Edit", match: :first

    fill_in "Program workout", with: @exercise_collection.program_workout_id
    fill_in "Title", with: @exercise_collection.title
    click_on "Update Exercise collection"

    assert_text "Exercise collection was successfully updated"
    click_on "Back"
  end

  test "destroying a Exercise collection" do
    visit exercise_collections_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Exercise collection was successfully destroyed"
  end
end
