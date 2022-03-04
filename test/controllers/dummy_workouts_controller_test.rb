require 'test_helper'

class DummyWorkoutsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dummy_workout = dummy_workouts(:one)
  end

  test "should get index" do
    get dummy_workouts_url
    assert_response :success
  end

  test "should get new" do
    get new_dummy_workout_url
    assert_response :success
  end

  test "should create dummy_workout" do
    assert_difference('DummyWorkout.count') do
      post dummy_workouts_url, params: { dummy_workout: { program_day_id: @dummy_workout.program_day_id, title: @dummy_workout.title, user_id: @dummy_workout.user_id } }
    end

    assert_redirected_to dummy_workout_url(DummyWorkout.last)
  end

  test "should show dummy_workout" do
    get dummy_workout_url(@dummy_workout)
    assert_response :success
  end

  test "should get edit" do
    get edit_dummy_workout_url(@dummy_workout)
    assert_response :success
  end

  test "should update dummy_workout" do
    patch dummy_workout_url(@dummy_workout), params: { dummy_workout: { program_day_id: @dummy_workout.program_day_id, title: @dummy_workout.title, user_id: @dummy_workout.user_id } }
    assert_redirected_to dummy_workout_url(@dummy_workout)
  end

  test "should destroy dummy_workout" do
    assert_difference('DummyWorkout.count', -1) do
      delete dummy_workout_url(@dummy_workout)
    end

    assert_redirected_to dummy_workouts_url
  end
end
