require "rails_helper"

feature "Princess Robot Index" do
  let!(:princess_robot_1) { FactoryGirl.create(:princess_robot) }
  let!(:princess_robot_2) { FactoryGirl.create(:princess_robot) }

  scenario "User visits root path and sees a list of princess robots" do
    visit root_path

    expect(page).to have_content(princess_robot_1.name)
    expect(page).to have_content(princess_robot_2.name)
  end

  scenario "User visits princess robot index path directly" do
    visit princess_robots_path

    expect(page).to have_content(princess_robot_1.name)
    expect(page).to have_content(princess_robot_2.name)
  end
end
