class GamesController < ApplicationController
	def index
	end
	
	def new
		@games = Game.all
		@game = Game.new
	end

	def create
		logger.debug("create")
		@game = Game.create!(player_one_id: params[:game][:player_one_id], 
			player_two_id: params[:game][:player_two_id], winner_id: params[:game][:winner_id])
		ActionCable.server.broadcast "games", render( partial: 'games/game', object: @game )
	end

	def show
	end
end
