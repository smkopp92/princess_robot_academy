class PrincessRobot < ApplicationRecord
  has_many :mentees

  validates :name, presence: true, uniqueness: true, format: { with: /Ezra/, message: "is not a name of a princess robot!!"}
  validates :purpose, presence: true
  validates :power_level, numericality: { greater_than: 9000, message: "is not over 9000!!!!" }

  def greet_mentees
    result_string = ""
    mentees.each do |mentee|
      result_string += "Greetings, #{mentee.name}! Beep Boop!\n"
    end
    if result_string.empty?
      result_string = "Forever Alone"
    end
    result_string
  end
end
