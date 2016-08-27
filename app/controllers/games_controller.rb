class GamesController < ApplicationController
	def index
		@games = Game.all
	end
	
	def new
		@games = Game.all
		@game = Game.new
		@game.choices.build
	end

	def edit
		@game = Game.find(params[:id])
	end

	def create
		logger.debug("create")

		@game = Game.create!
		logger.debug(@game)
		redirect_to(:action => 'edit', id: @game.id)
	end

	def update
		@game = Game.find(params[:id])
		
		
		
		if @game.choices.count == 1
			if @game.choices[0].user_id != current_user.id
				@game.choices.create!(game_params[:choices_attributes]["0"])
				@game.set_player_two(@game.choices[1].user_id)
				@game.set_winner
				@game.save
				ActionCable.server.broadcast "games", render( partial: 'games/game', object: @game )
			end
		elsif @game.choices.count == 0
			@game.choices.create!(game_params[:choices_attributes]["0"])
			@game.set_player_one(@game.choices[0].user_id)
			@game.save
			ActionCable.server.broadcast "games", render( partial: 'games/game', object: @game )
		end

		

		
	end

	def show
	end

	private

	def game_params
		params.require(:game).permit(choices_attributes: [:id, :user_id, :choice])
	end
end
