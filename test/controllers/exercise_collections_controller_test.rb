require 'test_helper'

class ExerciseCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @exercise_collection = exercise_collections(:one)
  end

  test "should get index" do
    get exercise_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_exercise_collection_url
    assert_response :success
  end

  test "should create exercise_collection" do
    assert_difference('ExerciseCollection.count') do
      post exercise_collections_url, params: { exercise_collection: { program_workout_id: @exercise_collection.program_workout_id, title: @exercise_collection.title } }
    end

    assert_redirected_to exercise_collection_url(ExerciseCollection.last)
  end

  test "should show exercise_collection" do
    get exercise_collection_url(@exercise_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_exercise_collection_url(@exercise_collection)
    assert_response :success
  end

  test "should update exercise_collection" do
    patch exercise_collection_url(@exercise_collection), params: { exercise_collection: { program_workout_id: @exercise_collection.program_workout_id, title: @exercise_collection.title } }
    assert_redirected_to exercise_collection_url(@exercise_collection)
  end

  test "should destroy exercise_collection" do
    assert_difference('ExerciseCollection.count', -1) do
      delete exercise_collection_url(@exercise_collection)
    end

    assert_redirected_to exercise_collections_url
  end
end
