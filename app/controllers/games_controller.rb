class GamesController < ApplicationController
  def index
  	@games = Game.all
  end

  def new
  	@game = Game.new
  end

  def show
  	@game = Game.find(params[:id])
  	@round = Round.new
  	@scores = Score.all
    @players = Player.all
    @winner = @game.winner
    #@winner = @game.players#.select('players.name, SUM(scores.value) AS total_score').joins(:scores).group('players.id').order('total_score DESC').limit(1).first
  end

  def create
    @game = Game.new(game_params)
    @game.save
    redirect_to @game
  end

  private
  def game_params
    params.require(:game).permit(:name, :status, players_attributes: [:name, :_destroy])
  end
end
