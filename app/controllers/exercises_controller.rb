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
    if form.valid?
      exercise = FindOrCreateExercise.new(form).call
      render json: exercise, status: :created
    else
      render json: form.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    form = ExerciseForm.new(permitted_params)
    exercise = Exercise.find(params[:id])
    exercise = UpdateExercise.new(exercise, form).call
    render json: exercise
  end

  private

  def permitted_params
    params.permit(*ExerciseForm::PERMITTED_PARAMS, :muscle_groups => [])
  end
end
