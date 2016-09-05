require "rails_helper"

describe "Game Play" do
	scenario "Player 1 enters the game" do
		user = create(:user) 

		sign_in user
		visit root_path

		click_link("New Game")
		click_button("Begin")

		expect(page).to have_content "Choice"
	end

	scenario "Player 1 submits a choice" do
		user = create(:user)
		sign_in user
		visit root_path

		click_link("New Game")
		click_button("Begin")
		
		select "Rock", from: "game_choices_attributes_0_choice"
		
		# all("input[name='game[choices_attributes][0][choice]']").each do |choice|
		# 	choice.set("Rock")
		# end
		
		click_button('Submit Choice')
		expect(page).to have_content "Player #1 chose Rock"
	end

	scenario "Player 2 enters the game" do 
		user = create(:user_two)
		game = create(:active_game)
		sign_in user
		visit root_path

		click_link("#{game.id}")
		expect(page).to have_content "Player # 1 made a choice"
	end

	scenario "Player 2 submits a choice" do
		user = create(:user_two)
		game = create(:active_game)

		sign_in user
		visit root_path

		click_link("#{game.id}")

		select "Paper", from: "game_choices_attributes_0_choice"

		click_button("Submit Choice")
		expect(page).to have_content "Player # 1 chose Rock"
		expect(page).to have_content "Player # 2 chose Paper"
		expect(page).to have_content "Player # 2 won the game!"
	end
end