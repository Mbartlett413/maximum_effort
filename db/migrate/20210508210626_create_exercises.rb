class CreateExercises < ActiveRecord::Migration[5.2]
  def change
    create_table :exercises do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.integer :primary_muscle
      t.integer :secondary_muscle
      t.integer :region_id
      t.boolean :primary_exercise
      t.boolean :accessory_exercise

      t.timestamps
    end
  end
end
