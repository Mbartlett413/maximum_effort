require 'test_helper'

class DummyWorkoutCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dummy_workout_collection = dummy_workout_collections(:one)
  end

  test "should get index" do
    get dummy_workout_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_dummy_workout_collection_url
    assert_response :success
  end

  test "should create dummy_workout_collection" do
    assert_difference('DummyWorkoutCollection.count') do
      post dummy_workout_collections_url, params: { dummy_workout_collection: { dummy_repetition_id: @dummy_workout_collection.dummy_repetition_id, exercise_id: @dummy_workout_collection.exercise_id } }
    end

    assert_redirected_to dummy_workout_collection_url(DummyWorkoutCollection.last)
  end

  test "should show dummy_workout_collection" do
    get dummy_workout_collection_url(@dummy_workout_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_dummy_workout_collection_url(@dummy_workout_collection)
    assert_response :success
  end

  test "should update dummy_workout_collection" do
    patch dummy_workout_collection_url(@dummy_workout_collection), params: { dummy_workout_collection: { dummy_repetition_id: @dummy_workout_collection.dummy_repetition_id, exercise_id: @dummy_workout_collection.exercise_id } }
    assert_redirected_to dummy_workout_collection_url(@dummy_workout_collection)
  end

  test "should destroy dummy_workout_collection" do
    assert_difference('DummyWorkoutCollection.count', -1) do
      delete dummy_workout_collection_url(@dummy_workout_collection)
    end

    assert_redirected_to dummy_workout_collections_url
  end
end
