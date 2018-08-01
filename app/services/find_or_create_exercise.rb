class FindOrCreateExercise
  attr_reader :form

  def initialize(form)
    @form = form
  end

  def call
    Exercise.find_or_create_by!(form.model_attributes) do |exercise|
      form.muscle_groups.each do |group|
        muscle_group = MuscleGroup.find_or_create_by!(name: group)
        ExerciseTarget.create!(exercise: exercise, muscle_group: muscle_group)
      end
    end
  end
end
