class FindOrCreateExercise
  attr_reader :exercise, :form

  def initialize(exercise, form)
    @exercise = exercise
    @form = form
  end

  def call
    if form.muscle_groups.present?
      exercise.muscle_groups.destroy_all
      form.muscle_groups.each do |group|
        muscle_group = MuscleGroup.find_or_create_by!(name: group)
        ExerciseTarget.create!(exercise: exercise, muscle_group: muscle_group)
      end
    end
    exercise.update!(form.model_attributes)
    exercise
  end
end
