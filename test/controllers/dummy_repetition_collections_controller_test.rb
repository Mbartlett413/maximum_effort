require 'test_helper'

class DummyRepetitionCollectionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dummy_repetition_collection = dummy_repetition_collections(:one)
  end

  test "should get index" do
    get dummy_repetition_collections_url
    assert_response :success
  end

  test "should get new" do
    get new_dummy_repetition_collection_url
    assert_response :success
  end

  test "should create dummy_repetition_collection" do
    assert_difference('DummyRepetitionCollection.count') do
      post dummy_repetition_collections_url, params: { dummy_repetition_collection: { dummy_repetition_id: @dummy_repetition_collection.dummy_repetition_id, percent_based: @dummy_repetition_collection.percent_based, rep_value: @dummy_repetition_collection.rep_value, set_value: @dummy_repetition_collection.set_value } }
    end

    assert_redirected_to dummy_repetition_collection_url(DummyRepetitionCollection.last)
  end

  test "should show dummy_repetition_collection" do
    get dummy_repetition_collection_url(@dummy_repetition_collection)
    assert_response :success
  end

  test "should get edit" do
    get edit_dummy_repetition_collection_url(@dummy_repetition_collection)
    assert_response :success
  end

  test "should update dummy_repetition_collection" do
    patch dummy_repetition_collection_url(@dummy_repetition_collection), params: { dummy_repetition_collection: { dummy_repetition_id: @dummy_repetition_collection.dummy_repetition_id, percent_based: @dummy_repetition_collection.percent_based, rep_value: @dummy_repetition_collection.rep_value, set_value: @dummy_repetition_collection.set_value } }
    assert_redirected_to dummy_repetition_collection_url(@dummy_repetition_collection)
  end

  test "should destroy dummy_repetition_collection" do
    assert_difference('DummyRepetitionCollection.count', -1) do
      delete dummy_repetition_collection_url(@dummy_repetition_collection)
    end

    assert_redirected_to dummy_repetition_collections_url
  end
end
