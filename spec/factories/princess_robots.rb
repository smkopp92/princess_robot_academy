FactoryGirl.define do
  factory :princess_robot do
    sequence(:name) { |n| "Ezra #{n}.0"}
    purpose "Pass Butter"
    favorite_romantic_comedy "P.S. I Love You"
    power_level 9001
  end
end
