class DummyRepetition < ApplicationRecord
	has_many :dummy_repetition_collections, dependent: :destroy
end
