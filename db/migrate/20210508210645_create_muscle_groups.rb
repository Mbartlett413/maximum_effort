class CreateMuscleGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :muscle_groups do |t|
      t.string :muscle_title
      t.integer :region_id
      
      t.timestamps
    end
  end
end
