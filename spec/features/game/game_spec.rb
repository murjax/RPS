require "rails_helper"

describe "Game Play" do
	scenario "Player 1 enters the game" do
		user = create(:user) 

		sign_in user
		visit root_path

		click_link("New Game")
		visit edit_game_path(Game.last.id)
		expect(page).to have_content "Choice"
	end

	scenario "Player 1 submits a choice" do
		user = create(:user)
		sign_in user
		visit root_path

		click_link("New Game")
		
		visit edit_game_path(Game.last.id)
		select "Rock", from: "game_choices_attributes_0_choice"
		
		click_button('Submit Choice')
		expect(page).to have_content "Player #1 chose Rock"
	end

	scenario "Player 2 enters the game" do 
		user = create(:user_two)
		game = create(:active_game)
		sign_in user
		visit root_path
		click_link("#{Game.last.id}")
		expect(page).to have_content "made a choice"
	end

	scenario "Player 2 submits a choice" do
		user = create(:user_two)
		game = create(:active_game)

		sign_in user
		visit root_path

		click_link("#{game.id}")

		select "Paper", from: "game_choices_attributes_0_choice"

		click_button("Submit Choice")
		expect(page).to have_content "Player # 2 won the game!"
	end
end