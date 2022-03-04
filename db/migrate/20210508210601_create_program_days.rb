class CreateProgramDays < ActiveRecord::Migration[5.2]
  def change
    create_table :program_days do |t|
      t.string :title
      t.belongs_to :program_week, foreign_key: true
      t.boolean :active_day
      t.integer :dummy_workout_id

      t.timestamps
    end
  end
end
