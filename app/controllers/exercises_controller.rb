class ExercisesController < ApplicationController
  before_action :authenticate

  def index
    render json: Exercise.all
  end

  def show
    render json: Exercise.find(params[:id])
  end

  def create
    form = ExerciseForm.new(permitted_params)
    exercise = FindOrCreateExercise.new(form).call
    render json: exercise
  end

  def update
    debugger
  end

  private

  def permitted_params
    params.permit(*ExerciseForm::PERMITTED_PARAMS, :muscle_groups => [])
  end
end
