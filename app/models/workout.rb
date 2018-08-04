class Workout < ApplicationRecord
  has_many :exercise_logs, dependent: :destroy
  has_many :exercises, through: :exercise_logs
end
