class ScoresController < ApplicationController
	def index
  	@scores = Score.all
  end

  def new
  	@score = Score.new
  end

  def show
  	@score = Score.find(params[:id])
  end

  def create
	respond_to do |format|
    format.js
    format.html
  	end
  end

  private
  def score_params
    params.require(:score).permit(:value, :round_id, :player_id)
  end
end
