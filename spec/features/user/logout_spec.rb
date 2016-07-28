require "rails_helper"

feature "User logs out" do

	scenario "User logs out" do
		user = create(:user)
		visit root_path
		within(".row") do
			click_link("Login")
		end
		fill_in "Email", with: user.email
		fill_in "Password", with: user.password
		click_button "Log in"
		click_link("Logout")
		expect(page).to have_content "Signed in successfully."
	end
end