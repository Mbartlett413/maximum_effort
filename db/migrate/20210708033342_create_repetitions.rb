class CreateRepetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :repetitions do |t|
      t.belongs_to :user, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
