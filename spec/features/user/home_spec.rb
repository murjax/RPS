require "rails_helper"

feature "Visiting Home Page" do 
	scenario "User clicks on 'Home' menu link" do
		visit root_path
		expect(page).to have_content "Welcome to Rock Paper Scissors"
	end 

	scenario "User clicks on 'login' link" do
		visit root_path
		within(".row") do
			click_link("Login")
		end
		expect(page).to have_content "Log in"
	end

	scenario "User clicks on 'register' link" do
		visit root_path
		click_link "Register"
		expect(page).to have_content "New Account"
	end
end