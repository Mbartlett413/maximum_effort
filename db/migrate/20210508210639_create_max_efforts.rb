class CreateMaxEfforts < ActiveRecord::Migration[5.2]
  def change
    create_table :max_efforts do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :exercise_id
      t.integer :max_value

      t.timestamps
    end
  end
end
