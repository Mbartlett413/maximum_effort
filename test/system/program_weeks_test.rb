require "application_system_test_case"

class ProgramWeeksTest < ApplicationSystemTestCase
  setup do
    @program_week = program_weeks(:one)
  end

  test "visiting the index" do
    visit program_weeks_url
    assert_selector "h1", text: "Program Weeks"
  end

  test "creating a Program week" do
    visit program_weeks_url
    click_on "New Program Week"

    check "Active week" if @program_week.active_week
    fill_in "Program", with: @program_week.program_id
    fill_in "Title", with: @program_week.title
    click_on "Create Program week"

    assert_text "Program week was successfully created"
    click_on "Back"
  end

  test "updating a Program week" do
    visit program_weeks_url
    click_on "Edit", match: :first

    check "Active week" if @program_week.active_week
    fill_in "Program", with: @program_week.program_id
    fill_in "Title", with: @program_week.title
    click_on "Update Program week"

    assert_text "Program week was successfully updated"
    click_on "Back"
  end

  test "destroying a Program week" do
    visit program_weeks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Program week was successfully destroyed"
  end
end
