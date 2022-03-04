require "application_system_test_case"

class ProgramDaysTest < ApplicationSystemTestCase
  setup do
    @program_day = program_days(:one)
  end

  test "visiting the index" do
    visit program_days_url
    assert_selector "h1", text: "Program Days"
  end

  test "creating a Program day" do
    visit program_days_url
    click_on "New Program Day"

    check "Active day" if @program_day.active_day
    fill_in "Program week", with: @program_day.program_week_id
    fill_in "Title", with: @program_day.title
    click_on "Create Program day"

    assert_text "Program day was successfully created"
    click_on "Back"
  end

  test "updating a Program day" do
    visit program_days_url
    click_on "Edit", match: :first

    check "Active day" if @program_day.active_day
    fill_in "Program week", with: @program_day.program_week_id
    fill_in "Title", with: @program_day.title
    click_on "Update Program day"

    assert_text "Program day was successfully updated"
    click_on "Back"
  end

  test "destroying a Program day" do
    visit program_days_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Program day was successfully destroyed"
  end
end
