require 'rails_helper'

describe "Game" do 
	let(:game) {Game.new}
	let(:rock) {{game_id: game.id, user_id: 1, choice: "Rock"}}
	let(:paper) {{game_id: game.id, user_id: 2, choice: "Paper"}}
	let(:scissors) {{game_id: game.id, user_id: 3, choice: "Scissors"}}
	scenario "Game has no more than two choices" do
		finished_game = create(:finished_game)
		finished_game.choices.create!(scissors)
		expect(finished_game).to_not be_valid
	end

	scenario "Game winner has numerical ID" do
		user = create(:user)
		game.winner_id = user.id
		expect(game.winner_id).to be_kind_of(Fixnum)
	end
end