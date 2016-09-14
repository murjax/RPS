require 'rails_helper'

describe "User" do 
	
	scenario "Expected user credentials should be valid" do
		user = User.new(username: "someuser", email: "email@example.com", password: "password123")
		expect(user).to be_valid
	end

	scenario "User must have username" do
		user = User.new(email: "email@example.com", password: "password123")
		expect(user).to_not be_valid
	end

	scenario "Non-alphanumeric characters are not permitted in a username" do
		user = User.new(username: "some_user", email: "email@example.com", password: "password123")
		expect(user).to_not be_valid
	end

	scenario "User must have an email" do
		user = User.new(username: "someuser", password: "password123")
		expect(user).to_not be_valid
	end

	scenario "Non-email formats are not permitted as email" do
		user = User.new(username: "someuser", email: "email_at_example.com", password: "password123")
		expect(user).to_not be_valid
	end

	scenario "User must have a password" do
		user = User.new(username: "someuser", email: "email@example.com")
		expect(user).to_not be_valid
	end

	scenario "Password must be at least 6 characters long" do
		user = User.new(username: "someuser", email: "email_at_example.com", password: "123")
		expect(user).to_not be_valid
	end

	scenario "Must have a rating" do
		user = User.new(username: "someuser", email: "email_at_example.com", password: "123")
		expect(user.rating).to_not be_nil
	end

	scenario "Rating can be incremented with 'increase_rating' method " do
		user = create(:user)
		current_rating = user.rating
		user.increase_rating
		expect(user.rating).to eq(current_rating + 1)
	end

end