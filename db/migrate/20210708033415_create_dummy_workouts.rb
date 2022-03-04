class CreateDummyWorkouts < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_workouts do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.string :workout_notes
      t.belongs_to :program_day, foreign_key: true
      t.boolean :active_day
      t.boolean :workout_complete
      t.boolean :workout_missed
      
      t.timestamps
    end
  end
end
