class ExerciseLogsController < ApplicationController
  before_action :authenticate

  def show
    render json: ExerciseLog.find(params[:id])
  end

  def create
    form = ExerciseLogForm.new(permitted_params)
    if form.valid?
      exercise_log = ExerciseLog.create!(form.model_attributes)
      render json: exercise_log, status: :created
    else
      render json: form.errors.full_messages, status: :unprocessable_entity
    end
  end

  def update
    exercise_log = ExerciseLog.find(params[:id])
    form = ExerciseLogForm.new(permitted_params)
    if form.valid?
      exercise_log.update!(form.model_attributes)
      render json: exercise_log
    else
      render json: form.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    ExerciseLog.find(params[:id]).destroy!
    head :no_content
  end

  private

  def permitted_params
    params.permit(*ExerciseLogForm::PERMITTED_PARAMS, :data => {})
  end
end
