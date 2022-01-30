# frozen_string_literal: true

class GoalsController < ApplicationController
  def create
    goal = Goal.new(permitted_params)
    goal.owner = current_user

    if goal.save
      render json: goal, status: :created
    else
      render json: goal.errors, status: :bad_request
    end
  end

  private

  def permitted_params
    params.require(:goal).permit(:title, :start_date, :end_date)
  end
end
