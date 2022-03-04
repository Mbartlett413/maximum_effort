class ExerciseCollection < ApplicationRecord
  belongs_to :program_workout
  belongs_to :exercise
  belongs_to :repetition
end
