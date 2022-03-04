class DummyWorkout < ApplicationRecord
  belongs_to :user
  belongs_to :program_day
  has_many :dummy_workout_collections, dependent: :destroy
end 
