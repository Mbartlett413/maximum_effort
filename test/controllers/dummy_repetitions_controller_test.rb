require 'test_helper'

class DummyRepetitionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dummy_repetition = dummy_repetitions(:one)
  end

  test "should get index" do
    get dummy_repetitions_url
    assert_response :success
  end

  test "should get new" do
    get new_dummy_repetition_url
    assert_response :success
  end

  test "should create dummy_repetition" do
    assert_difference('DummyRepetition.count') do
      post dummy_repetitions_url, params: { dummy_repetition: { title: @dummy_repetition.title } }
    end

    assert_redirected_to dummy_repetition_url(DummyRepetition.last)
  end

  test "should show dummy_repetition" do
    get dummy_repetition_url(@dummy_repetition)
    assert_response :success
  end

  test "should get edit" do
    get edit_dummy_repetition_url(@dummy_repetition)
    assert_response :success
  end

  test "should update dummy_repetition" do
    patch dummy_repetition_url(@dummy_repetition), params: { dummy_repetition: { title: @dummy_repetition.title } }
    assert_redirected_to dummy_repetition_url(@dummy_repetition)
  end

  test "should destroy dummy_repetition" do
    assert_difference('DummyRepetition.count', -1) do
      delete dummy_repetition_url(@dummy_repetition)
    end

    assert_redirected_to dummy_repetitions_url
  end
end
