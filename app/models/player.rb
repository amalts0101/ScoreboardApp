class Player < ApplicationRecord
	belongs_to :game
	has_many :scores

	def total_score
		self.scores.sum(:value)
	end
end
