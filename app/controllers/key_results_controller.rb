# frozen_string_literal: true

class KeyResultsController < ApplicationController
  before_action :set_goal, only: [:create]

  def create
    kr = @goal.key_results.new(permitted_params)

    if kr.valid?
      render json: kr, status: :created
    else
      render json: { errors: kr.errors }, status: :bad_request
    end
  end

  private

  def set_goal
    @goal = Goal.find(params[:goal_id])
  end

  def permitted_params
    params.require(:key_result).permit(:title, :started_at, :completed_at)
  end
end
