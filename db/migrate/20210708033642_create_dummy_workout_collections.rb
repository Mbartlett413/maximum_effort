class CreateDummyWorkoutCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_workout_collections do |t|
      t.integer :exercise_id
      t.integer :dummy_repetition_id
      t.belongs_to :dummy_workout, foreign_key: true
      t.string :athlete_notes
      t.string :coach_notes

      t.timestamps
    end
  end
end
