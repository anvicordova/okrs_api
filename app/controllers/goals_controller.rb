class GoalsController < ApplicationController
  def create
    goal = Goal.create(permitted_params)

    if goal.valid?
      render json: goal
    else
      render json: {status: "error", code: 404}
    end
  end

  private

  def permitted_params
    params.require(:goal).permit(:title)
  end
end