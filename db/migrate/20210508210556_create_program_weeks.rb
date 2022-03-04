class CreateProgramWeeks < ActiveRecord::Migration[5.2]
  def change
    create_table :program_weeks do |t|
      t.string :title
      t.belongs_to :program, foreign_key: true
      t.boolean :active_week

      t.timestamps
    end
  end
end
