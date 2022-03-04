require "application_system_test_case"

class ProgramWorkoutsTest < ApplicationSystemTestCase
  setup do
    @program_workout = program_workouts(:one)
  end

  test "visiting the index" do
    visit program_workouts_url
    assert_selector "h1", text: "Program Workouts"
  end

  test "creating a Program workout" do
    visit program_workouts_url
    click_on "New Program Workout"

    fill_in "Program day", with: @program_workout.program_day_id
    fill_in "Title", with: @program_workout.title
    fill_in "Workout notes", with: @program_workout.workout_notes
    click_on "Create Program workout"

    assert_text "Program workout was successfully created"
    click_on "Back"
  end

  test "updating a Program workout" do
    visit program_workouts_url
    click_on "Edit", match: :first

    fill_in "Program day", with: @program_workout.program_day_id
    fill_in "Title", with: @program_workout.title
    fill_in "Workout notes", with: @program_workout.workout_notes
    click_on "Update Program workout"

    assert_text "Program workout was successfully updated"
    click_on "Back"
  end

  test "destroying a Program workout" do
    visit program_workouts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Program workout was successfully destroyed"
  end
end
