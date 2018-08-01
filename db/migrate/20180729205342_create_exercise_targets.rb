class CreateExerciseTargets < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_targets do |t|
      t.references :exercise, foreign_key: true, null: false
      t.references :muscle_group, foreign_key: true, null: false
    end
  end
end
