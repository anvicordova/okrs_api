# frozen_string_literal: true

class GoalsController < ApplicationController
  def create
    goal = Goal.create(permitted_params)

    if goal.valid?
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
