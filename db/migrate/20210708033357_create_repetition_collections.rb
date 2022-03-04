class CreateRepetitionCollections < ActiveRecord::Migration[5.2]
  def change
    create_table :repetition_collections do |t|
      t.belongs_to :repetition, foreign_key: true
      t.integer :set_value
      t.boolean :percent_based
      t.integer :rep_value

      t.timestamps
    end
  end
end
