require "rails_helper"

feature "Princess Robot Create" do
  scenario "User visits princess robots index and visits link to princess robot form" do
    visit princess_robots_path

    click_on "Add New Robot Princess"

    expect(page.current_path).to eq new_princess_robot_path
  end

  scenario "User successfully creates a new robot and is taken back to the index" do
    visit new_princess_robot_path

    fill_in "Name", with: "Ezra 2.0"
    fill_in "Purpose", with: "Pass Butter"
    fill_in "Favorite Romantic Comedy", with: "The Notebook"
    fill_in "Power Level", with: 9001

    click_button "GENERATE!"

    expect(page.current_path).to eq princess_robots_path
    expect(page).to have_content "Ezra 2.0"
  end

  scenario "User submitting trash data should reshow the new page, flash error message, and keep data from bad submission" do
    visit new_princess_robot_path

    fill_in "Name", with: "Sebastian"
    fill_in "Power Level", with: 8999
    fill_in "Favorite Romantic Comedy", with: "500 Days of Summer"

    click_button "GENERATE!"

    expect(page).to have_content "Name is not a name of a princess robot!!"
    expect(page).to have_content "Purpose can't be blank"
    expect(page).to have_content "Power level is not over 9000!!!!"

    expect(find_field("Favorite Romantic Comedy").value).to eq "500 Days of Summer"
  end
end
