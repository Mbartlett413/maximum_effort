class Program < ApplicationRecord
  belongs_to :user
  has_many :program_weeks, dependent: :destroy 


  def self.create_week_day(data, program)
  	
		logger.debug("data #{data}")
		logger.debug("program #{program}")
		number_of_weeks = data[:number_of_weeks]
		days_per_week = data[:days_per_week]

		@week_count = 1
		i = 0
		while i < number_of_weeks.to_i
				@new_program_weeks = ProgramWeek.new 
				@new_program_weeks.title = "#{program.title}_Week" + @week_count.to_s
				@new_program_weeks.program = program
				@new_program_weeks.active_week = false  
				@new_program_weeks.save
				

					#create associated_days
					@day_count = 1
					e = 0
					while e < days_per_week.to_i
							new_days = ProgramDay.new
							new_days.title = "#{program.title}:Week_" + @week_count.to_s + "_Day_" + @day_count.to_s
							new_days.program_week = @new_program_weeks
							new_days.dummy_workout_id = nil
							new_days.active_day = false 
							new_days.save
							@day_count = @day_count + 1
					e = e + 1
					end 
				@week_count = @week_count + 1

		i = i + 1
		end 
  end 

  def self.super_amazing_cloning_device_GO(day,workout,owner)
  	clone_me = ProgramWorkout.find(workout)
 
 		p 'create dummy workout'
  	@dummyworkout = DummyWorkout.new
			@dummyworkout.user = owner
			@dummyworkout.title = clone_me.title
			@dummyworkout.workout_notes = clone_me.workout_notes
				@day = ProgramDay.find(day) 		
				p 'here'
				p @day 		
			@dummyworkout.program_day = @day
  	@dummyworkout.save!

  	@day.update_attribute(:dummy_workout_id, @dummyworkout.id)
  	p 'assign day'
  	

  	#loop through each exercise collection
  	clone_me.exercise_collections.each do |ec|

  			#Create Repetition and Repetition Collection
				rep = Repetition.find(ec.repetition_id) 

				@dr = DummyRepetition.new
					@dr.title = rep.title
				@dr.save

				#create repetiton collection
				rep.repetition_collections.each do |rc|
					@drc = DummyRepetitionCollection.new
						@drc.dummy_repetition = @dr
						@drc.set_value = rc.set_value
						@drc.percent_based = rc.percent_based
						@drc.rep_value = rc.rep_value
					@drc.save
				end 

  			#Create the WorkoutCollection
	  		@dummy_workout_collection = DummyWorkoutCollection.new
	  			@dummy_workout_collection.dummy_workout_id = @dummyworkout.id
					@dummy_workout_collection.exercise_id = ec.exercise_id
					@dummy_workout_collection.dummy_repetition_id = @dr.id
				@dummy_workout_collection.save 
  	end 
  end 

end


