require 'rails_helper'
describe "Choice" do 
	describe "Choice should be either 'Rock', 'Paper', or 'Scissors'" do
		scenario "Choice is Rock" do
			rock = Choice.new(user_id: 1, choice: "Rock") 
			expect(rock).to be_valid
		end

		scenario "Choice is Scissors" do
			scissors = Choice.new(user_id: 1, choice: "Scissors")
			expect(scissors).to be_valid
		end

		scenario "Choice is Paper" do
			paper = Choice.new(user_id: 1, choice: "Paper")
			expect(paper).to be_valid
		end

		scenario "Choice is Tree" do
			tree = Choice.new(user_id: 1, choice: "Tree")
			expect(tree).to_not be_valid
		end
	end

	describe "Choice should have a User id" do
		scenario "Choice is valid with User id" do
			rock = Choice.new(user_id: 1, choice: "Rock")
			expect(rock).to be_valid
		end

		scenario "Choice is invalid without User id" do
			rock = Choice.new(choice: "Rock")
			expect(rock).to_not be_valid
		end

	end
end


