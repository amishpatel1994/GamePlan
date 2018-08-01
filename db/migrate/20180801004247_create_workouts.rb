class CreateWorkouts < ActiveRecord::Migration[5.1]
  def change
    create_table :workouts do |t|
      t.timestamp :day, null: false
      t.string :title, null: false
      t.timestamps
    end
  end
end
