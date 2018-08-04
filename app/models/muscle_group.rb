class MuscleGroup < ApplicationRecord
  has_many :exercise_targets, dependent: :destroy
  has_many :exercises, through: :exercise_targets
end
