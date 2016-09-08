class GamesController < ApplicationController
	def index
		@games = Game.joins(:choices).group( 'games.id' ).having( 'count( game_id ) == 1' )
	end
	
	def create

		@game = Game.create!
		redirect_to(:action => 'edit', id: @game.id)
	end

	def edit
		@game = Game.find(params[:id])

		if @game.choices.count == 1
			if @game.choices[0].user_id == current_user.id
				flash.now[:notice] = "You have already submitted your choice. Please wait for a second
					player to make their choice."
			end
		end
	end

	def update
		@game = Game.find(params[:id])
		
		
		
		if @game.choices.count == 1
			if @game.choices[0].user_id != current_user.id

				if @game.choices.create(game_params[:choices_attributes]["0"])
					@game.set_player_two(@game.choices[1].user_id)
					@game.set_winner
					@game.save
					ActionCable.server.broadcast "games", render( partial: 'games/game', object: @game )
				end
			end
		elsif @game.choices.count == 0

			if @game.choices.create(game_params[:choices_attributes]["0"])
				@game.set_player_one(@game.choices[0].user_id)
				@game.save
				ActionCable.server.broadcast "games", render( partial: 'games/game', object: @game )
			end
			
			
		end

		

		
	end

	def show
	end

	private

	def game_params
		params.require(:game).permit(choices_attributes: [:id, :user_id, :choice])
	end
end
