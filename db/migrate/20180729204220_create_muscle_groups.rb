class CreateMuscleGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :muscle_groups do |t|
      t.string :name, null: false
    end

    %w(Quadriceps Hamstrings Calves Chest Back Shoulders Triceps Biceps Forearms Trapezius Abs).each do |group|
      MuscleGroup.create(name: group)
    end
  end
end
