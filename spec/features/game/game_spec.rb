require "rails_helper"

describe "Game Play" do
	scenario "Player 1 enters the game" do
		user = create(:user) 
		visit root_path

		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"

		click_link("New Game")
		click_button("Begin")

		expect(page).to have_content "Submit Choice"
	end

	scenario "Player 1 submits a choice" do
		user = create(:user)
		visit root_path

		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"


		click_link("New Game")
		click_link("Begin")

		fill_in "Choice", with: "Rock"
		click_link("Submit Choice")
		expect(page).to have_content "Player #1 chose Rock"
	end

	scenario "Player 2 enters the game" do 
		user = create(:user)
		visit root_path

		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"


		click_link("Join Existing Game")
		click_link("Join")

		expect(page).to have_content "Player #1 chose"
	end

	scenario "Player 2 submits a choice" do
		user = create(:user)
		visit root_path

		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"


		click_link("Join Existing Game")
		click_link("Join")
		fill_in "Choice", with: "Paper"
		click_link("Submit Choice")
		expect(page).to have_content "Player #1 chose Rock"
		expect(page).to have_content "Player #2 chose Paper"
		expect(page).to have_content "Player #2 won the game!"
	end
end