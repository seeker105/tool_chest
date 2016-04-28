require 'test_helper'

class UserCreatesToolTest < ActionDispatch::IntegrationTest

  test "user can create a tool" do
    # a user will go to the new form
    visit new_tool_path

    # they will enter dadata in each of the fielsd
    fill_in "Name", with: "Screwdriver"
    fill_in "Price:", with: "10.99"
    fill_in "Quntity", with: "10"


    # then they will be taken to that tools show page and expect to see that data that was submitted
    click_button "Create Tool"

    assert_equal tool_path(Tool.last.id), current_path


    within(".tool_info") do
      assert page.has_content("Screwdriver")
      assert page.has_content?("10.99")
      assert page.has_content("10")
    end
  end

end
