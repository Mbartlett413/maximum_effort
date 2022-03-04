class CreateProgramWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :program_workouts do |t|
      t.string :title
      t.string :workout_notes

      t.timestamps
    end
  end
end
