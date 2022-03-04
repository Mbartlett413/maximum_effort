class ProgramWorkout < ApplicationRecord
  has_many :exercise_collections
  has_many :program_days

  def self.create_workout_collection(exercise, repScheme, owner)
      i = 0
      while i < exercise.split(',').length
          ec = ExerciseCollection.new
          ec.program_workout = owner
          ec.exercise_id = exercise.split(',')[i]
          ec.repetition_id =repScheme.split(',')[i]
          ec.save
      i = i + 1
      end
  end


end
