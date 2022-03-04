class DummyWorkoutCollection < ApplicationRecord
	belongs_to :dummy_workout
  	belongs_to :exercise
  	belongs_to :dummy_repetition, dependent: :destroy
end
