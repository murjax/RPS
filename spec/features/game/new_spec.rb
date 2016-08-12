require 'rails_helper'

describe "Starting a new game" do 
	scenario "New game page is visted" do 
		visit root_path
		click_link("New Game")
		expect(page).to have_content "Begin"
	end
end