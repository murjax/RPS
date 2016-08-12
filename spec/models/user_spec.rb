require 'rails_helper'

describe "User" do 
	user = create(:user)
	scenario "User should have alphanumeric username" do
		expect(user).to be_valid
	end

	scenario "User should have email in format of 'email@example.com'" do
		expect(user).to be_valid
	end

	scenario "User should have password that is at least 6 characters long" do
		expect(user).to be_valid
	end

end