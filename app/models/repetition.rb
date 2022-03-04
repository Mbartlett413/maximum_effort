class Repetition < ApplicationRecord
  belongs_to :user
  has_many :repetition_collections

  def self.create_rep_collection(percent_array, sets, reps, owner)
      i = 0
      while i < sets.split(',').length
        rc = RepetitionCollection.new
        rc.repetition = owner
        rc.set_value = sets.split(',')[i]
        rc.percent_based = percent_array.split(',')[i] =="percent" ? true : false 
        rc.rep_value = reps.split(',')[i]
        rc.save
      i = i + 1
      end
  end 



end
