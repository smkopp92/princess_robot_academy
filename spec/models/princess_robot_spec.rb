require "rails_helper"

describe PrincessRobot do
  it { should have_many :mentees }

  it { should have_valid(:name).when("Ezra 1.0", "Ezra 2.0") }
  it { should_not have_valid(:name).when(nil, "", "Sebastian") }

  it { should have_valid(:purpose).when("Pass butter.") }
  it { should_not have_valid(:purpose).when(nil, "") }

  it { should have_valid(:favorite_romantic_comedy).when("Love Actually", nil, "") }

  it { should have_valid(:power_level).when(9001) }
  it { should_not have_valid(:power_level).when(nil, "", 8999, true, "Bob") }

  describe "#greet_mentees" do
    let(:princess_robot) { FactoryGirl.create(:princess_robot) }
    let(:sad_princess_robot) { FactoryGirl.create(:princess_robot) }
    let!(:mentee_1) {
      FactoryGirl.create(:mentee,
        princess_robot: princess_robot
      )
    }
    let!(:mentee_2) {
      FactoryGirl.create(:mentee,
        princess_robot: princess_robot,
        name: "Phil"
      )
    }

    it "should output greetings to all mentees if mentees exist" do
      expect(princess_robot.greet_mentees).to eq("Greetings, #{mentee_1.name}! Beep Boop!\nGreetings, #{mentee_2.name}! Beep Boop!\n")
    end

    it "should output sad message if princess robot has no mentees" do
      expect(sad_princess_robot.greet_mentees).to eq("Forever Alone")
    end
  end
end
