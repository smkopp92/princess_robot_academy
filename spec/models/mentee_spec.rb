require "rails_helper"

describe Mentee do
  it { should belong_to :princess_robot }
  
  it { should have_valid(:name).when("Chris", "Dave") }
  it { should_not have_valid(:name).when(nil, "") }
end
