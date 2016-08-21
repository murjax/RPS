require 'rails_helper'

describe "User" do 
	
	scenario "User should have alphanumeric username" do
		user = create(:user)
		expect(user).to be_valid
	end

	scenario "User should have email in format of 'email@example.com'" do
		user = create(:user)
		expect(user).to be_valid
	end

	scenario "User should have password that is at least 6 characters long" do
		user = create(:user)
		expect(user).to be_valid
	end

end