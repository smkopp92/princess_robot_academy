class Mentee < ActiveRecord::Base
  belongs_to :princess_robot
  
  validates :name, presence: true
  validates :princess_robot_id, presence: true
end
