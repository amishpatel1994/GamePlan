class CreateExerciseLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :exercise_logs do |t|
      t.references :workout, foreign_key: true, null: false
      t.references :exercise, foreign_key: true, null: false
      t.jsonb :data, null: false, default: {}
    end
  end
end
