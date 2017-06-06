require "rails_helper"

feature "Princess Robot Show" do
  let!(:princess_robot) { FactoryGirl.create(:princess_robot) }

  scenario "User visits princess robots path and visit show page through a link" do
    visit princess_robots_path

    click_on princess_robot.name

    expect(page.current_path).to eq princess_robot_path(princess_robot)
  end

  scenario "User visits princess robot show page directly" do
    visit princess_robot_path(princess_robot)

    expect(page).to have_content(princess_robot.name)
    expect(page).to have_content(princess_robot.purpose)
    expect(page).to have_content(princess_robot.favorite_romantic_comedy)
    expect(page).to have_content(princess_robot.power_level)
  end

  scenario "Show list of mentees if they exist" do
    mentee_1 = FactoryGirl.create(:mentee, princess_robot: princess_robot)
    mentee_2 = FactoryGirl.create(:mentee, princess_robot: princess_robot)

    visit princess_robot_path(princess_robot)

    expect(page).to have_content(mentee_1.name)
    expect(page).to have_content(mentee_2.name)
  end
end
