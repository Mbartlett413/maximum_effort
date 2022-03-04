require 'test_helper'

class ProgramWeeksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program_week = program_weeks(:one)
  end

  test "should get index" do
    get program_weeks_url
    assert_response :success
  end

  test "should get new" do
    get new_program_week_url
    assert_response :success
  end

  test "should create program_week" do
    assert_difference('ProgramWeek.count') do
      post program_weeks_url, params: { program_week: { active_week: @program_week.active_week, program_id: @program_week.program_id, title: @program_week.title } }
    end

    assert_redirected_to program_week_url(ProgramWeek.last)
  end

  test "should show program_week" do
    get program_week_url(@program_week)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_week_url(@program_week)
    assert_response :success
  end

  test "should update program_week" do
    patch program_week_url(@program_week), params: { program_week: { active_week: @program_week.active_week, program_id: @program_week.program_id, title: @program_week.title } }
    assert_redirected_to program_week_url(@program_week)
  end

  test "should destroy program_week" do
    assert_difference('ProgramWeek.count', -1) do
      delete program_week_url(@program_week)
    end

    assert_redirected_to program_weeks_url
  end
end
