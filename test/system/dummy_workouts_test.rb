require "application_system_test_case"

class DummyWorkoutsTest < ApplicationSystemTestCase
  setup do
    @dummy_workout = dummy_workouts(:one)
  end

  test "visiting the index" do
    visit dummy_workouts_url
    assert_selector "h1", text: "Dummy Workouts"
  end

  test "creating a Dummy workout" do
    visit dummy_workouts_url
    click_on "New Dummy Workout"

    fill_in "Program day", with: @dummy_workout.program_day_id
    fill_in "Title", with: @dummy_workout.title
    fill_in "User", with: @dummy_workout.user_id
    click_on "Create Dummy workout"

    assert_text "Dummy workout was successfully created"
    click_on "Back"
  end

  test "updating a Dummy workout" do
    visit dummy_workouts_url
    click_on "Edit", match: :first

    fill_in "Program day", with: @dummy_workout.program_day_id
    fill_in "Title", with: @dummy_workout.title
    fill_in "User", with: @dummy_workout.user_id
    click_on "Update Dummy workout"

    assert_text "Dummy workout was successfully updated"
    click_on "Back"
  end

  test "destroying a Dummy workout" do
    visit dummy_workouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dummy workout was successfully destroyed"
  end
end
