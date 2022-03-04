require 'test_helper'

class RepetitionCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @repetition_collection = repetition_collections(:one)
  end

  test "should get index" do
    get repetition_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_repetition_collection_url
    assert_response :success
  end

  test "should create repetition_collection" do
    assert_difference('RepetitionCollection.count') do
      post repetition_collections_url, params: { repetition_collection: { percent_based: @repetition_collection.percent_based, rep_value: @repetition_collection.rep_value, repetition_id: @repetition_collection.repetition_id, set_value: @repetition_collection.set_value } }
    end

    assert_redirected_to repetition_collection_url(RepetitionCollection.last)
  end

  test "should show repetition_collection" do
    get repetition_collection_url(@repetition_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_repetition_collection_url(@repetition_collection)
    assert_response :success
  end

  test "should update repetition_collection" do
    patch repetition_collection_url(@repetition_collection), params: { repetition_collection: { percent_based: @repetition_collection.percent_based, rep_value: @repetition_collection.rep_value, repetition_id: @repetition_collection.repetition_id, set_value: @repetition_collection.set_value } }
    assert_redirected_to repetition_collection_url(@repetition_collection)
  end

  test "should destroy repetition_collection" do
    assert_difference('RepetitionCollection.count', -1) do
      delete repetition_collection_url(@repetition_collection)
    end

    assert_redirected_to repetition_collections_url
  end
end
