class ProgramDay < ApplicationRecord
  belongs_to :program_week
  has_one :dummy_workout, dependent: :destroy
end
