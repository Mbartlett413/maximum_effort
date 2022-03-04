require 'test_helper'

class ProgramWorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_workout = program_workouts(:one)
  end

  test "should get index" do
    get program_workouts_url
    assert_response :success
  end

  test "should get new" do
    get new_program_workout_url
    assert_response :success
  end

  test "should create program_workout" do
    assert_difference('ProgramWorkout.count') do
      post program_workouts_url, params: { program_workout: { program_day_id: @program_workout.program_day_id, title: @program_workout.title, workout_notes: @program_workout.workout_notes } }
    end

    assert_redirected_to program_workout_url(ProgramWorkout.last)
  end

  test "should show program_workout" do
    get program_workout_url(@program_workout)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_workout_url(@program_workout)
    assert_response :success
  end

  test "should update program_workout" do
    patch program_workout_url(@program_workout), params: { program_workout: { program_day_id: @program_workout.program_day_id, title: @program_workout.title, workout_notes: @program_workout.workout_notes } }
    assert_redirected_to program_workout_url(@program_workout)
  end

  test "should destroy program_workout" do
    assert_difference('ProgramWorkout.count', -1) do
      delete program_workout_url(@program_workout)
    end

    assert_redirected_to program_workouts_url
  end
end
