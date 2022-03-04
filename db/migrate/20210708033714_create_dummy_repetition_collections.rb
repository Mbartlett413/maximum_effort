class CreateDummyRepetitionCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :dummy_repetition_collections do |t|
      t.belongs_to :dummy_repetition, foreign_key: true
      t.integer :set_value
      t.boolean :percent_based
      t.integer :rep_value

      t.timestamps
    end
  end
end
