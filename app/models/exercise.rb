class Exercise < ApplicationRecord
  has_many :exercise_targets
  has_many :muscle_groups, through: :exercise_targets
end
