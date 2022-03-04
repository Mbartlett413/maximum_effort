class ProgramWeek < ApplicationRecord
  belongs_to :program
  has_many :program_days, dependent: :destroy
end
