class RoundsController < ApplicationController
	def new
		@round = Round.new
	end

	def create
		@game = Game.find(params[:game_id])
		@round = @game.rounds.create
		params[:score].each do |player_id, value|
			@round.scores.create(player_id: player_id, value: value)
		end
	end
end
