class CreateExerciseCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :exercise_collections do |t|
      t.belongs_to :program_workout, foreign_key: true
	  t.integer :exercise_id
	  t.integer :repetition_id


      t.timestamps
    end
  end
end
