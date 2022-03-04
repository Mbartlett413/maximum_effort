class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title
      t.integer :number_of_weeks
      t.integer :days_per_week

      t.timestamps
    end
  end
end
