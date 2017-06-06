require "rails_helper"

feature "Create Mentee" do
  let!(:princess_robot) { FactoryGirl.create(:princess_robot) }

  scenario "User visits princess robot show page, adds a mentee, and sees the mentee on the page" do
    visit princess_robot_path(princess_robot)

    fill_in "Mentee Name", with: "Meaghan"

    click_button "Add Fool"

    expect(page.current_path).to eq princess_robot_path(princess_robot)
    expect(page).to have_content("Meaghan")
    expect(page).to have_content("Mentee Added!")
  end

  scenario "User tries adding a nameless mentee" do
    visit princess_robot_path(princess_robot)

    click_button "Add Fool"

    expect(page.current_path).to eq princess_robot_path(princess_robot)
    expect(page).to have_content("You need a mentee name!")
  end
end
