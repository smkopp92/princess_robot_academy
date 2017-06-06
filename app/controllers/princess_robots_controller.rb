class PrincessRobotsController < ApplicationController
  def index
    @princess_robots = PrincessRobot.all
  end

  def show
    @princess_robot = PrincessRobot.find(params[:id])
    @mentees = @princess_robot.mentees
    @new_mentee = Mentee.new(princess_robot: @princess_robot)
  end

  def new
    @princess_robot = PrincessRobot.new
  end

  def create
    @princess_robot = PrincessRobot.new(princess_robot_params)
    if @princess_robot.save
      redirect_to princess_robots_path
    else
      render :new
    end
  end

  private

  def princess_robot_params
    params.require(:princess_robot).permit(
      :name,
      :purpose,
      :favorite_romantic_comedy,
      :power_level
    )
  end
end
