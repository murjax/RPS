require 'rails_helper'

describe "Game" do 
	let(:game) {Game.new}
	let(:rock) {{game_id: game.id, user_id: 1, choice: "Rock"}}
	let(:paper) {{game_id: game.id, user_id: 2, choice: "Paper"}}
	let(:scissors) {{game_id: game.id, user_id: 3, choice: "Scissors"}}
	scenario "Game has no more than two choices" do

		it "creates choices" do
			game.choices.create!(rock)
			game.choices.create!(paper)
			game.choices.create!(scissors)
		end
		

		expect(game.choices.count).to eq(2)
	end

	scenario "Game players have numerical IDs" do 
		user = create(:user)
		game.player_one_id = user.id
		expect(game.player_one_id).should be_kind_of(Fixnum)
	end

	scenario "Game winner has numerical ID" do
		user = create(:user)
		game.winner_id = user.id
		expect(game.winner_id).should be_kind_of(Fixnum)
	end

	scenario "When a second choice is submitted, a winner should be determined" do
		game.choices.create!(rock)
		game.choices.create!(paper)
		expect(game.winner_id).to eq(2)
	end
end