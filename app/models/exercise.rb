class Exercise < ApplicationRecord
  has_many :exercise_targets, dependent: :destroy
  has_many :muscle_groups, through: :exercise_targets
  has_many :exercise_logs
  has_many :workouts, through: :exercise_logs
end
