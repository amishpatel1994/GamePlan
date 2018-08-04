class WorkoutsController < ApplicationController
  before_action :authenticate

  def index
    render json: Workout.all
  end

  def show
    render json: Workout.find(params[:id])
  end

  def create
    day = params[:day] || Time.zone.now
    workout = Workout.find_or_create_by!(model_attributes)
    render json: workout
  end

  def update
    workout = Workout.find(params[:id])
    workout.update!(model_attributes)
    render json: workout
  end

  def destroy
    Workout.destroy!
    head :no_content
  end

  private

  def model_attributes
    {
      day: permitted_params[:day] || Time.zone.now,
      title: permitted_params[:title]
    }.compact
  end

  def permitted_params
    params.permit(:day, :title)
  end
end
