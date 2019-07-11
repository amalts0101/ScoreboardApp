class Round < ApplicationRecord
	has_many :scores
	belongs_to :game
end
