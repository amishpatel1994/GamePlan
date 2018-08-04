class ExerciseLogsController < ApplicationController
  before_action :authenticate

  def show
    render json: ExerciseLog.find(params[:id])
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def permitted_params
  end
end
