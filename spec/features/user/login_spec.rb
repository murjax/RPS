require "rails_helper"

feature "User logs in" do

	scenario "User logs in" do
		user = create(:user)
		visit root_path
		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"
		expect(page).to have_content "Signed in successfully."
	end
end