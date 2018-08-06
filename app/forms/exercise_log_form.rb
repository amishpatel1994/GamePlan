class ExerciseLogForm
  PERMITTED_PARAMS = %i(workout_id exercise_id data)
  include ActiveModel::Model

  attr_accessor *PERMITTED_PARAMS

  validates :workout_id, :exercise_id, :data, presence: true

  def model_attributes
    {
      workout_id: workout_id,
      exercise_id: exercise_id,
      data: data
    }
  end
end
