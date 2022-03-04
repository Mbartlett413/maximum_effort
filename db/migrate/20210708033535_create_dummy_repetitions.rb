class CreateDummyRepetitions < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_repetitions do |t|
      t.string :title

      t.timestamps
    end
  end
end
