class Game < ApplicationRecord
	has_many :players
	has_many :rounds
	validates :name, presence: true
	validates :name, length: { minimum: 1, message: "Type some name" }
	before_save :default_values
	accepts_nested_attributes_for :players, :allow_destroy => true

	def winner
		max_score = self.players.map(&:total_score).max
		self.players.select{|player| player.total_score == max_score}.first
	end

	def set_status
		self.status = 'Finished'
		self.save
	end

	def default_values
    	self.status ||= 'Started' # note self.status = 'P' if self.status.nil? might be safer (per @frontendbeauty)
  	end
end
