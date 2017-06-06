class MenteesController < ApplicationController
  def create
    @mentee = Mentee.new(
      name: params[:mentee][:name],
      princess_robot_id: params[:princess_robot_id]
    )
    if @mentee.save
      flash[:notice] = "Mentee Added!"
    else
      flash[:notice] = "You need a mentee name!"
    end
    redirect_to princess_robot_path(@mentee.princess_robot.id)
  end
end
