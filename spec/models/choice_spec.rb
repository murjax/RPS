require 'rails_helper'
let(:choice) {Choice.new}
describe "Choice" do 
	describe "Choice should be either 'Rock', 'Paper', or 'Scissors'" do
		scenario "Choice is Rock"
			choice.choice = "Rock"
			choice.user_id = 1
			expect(choice.save).to eq(true)
		end

		scenario "Choice is Paper"
			choice.choice = "Paper"
			choice.user_id = 1
			expect(choice.save).to eq(true)
		end

		scenario "Choice is Scissors"
			choice.choice = "Scissors"
			choice.user_id = 1
			expect(choice.save).to eq(true)
		end

		scenario "Choice is Tree"
			choice.choice = "Tree"
			choice.user_id = 1
			expect(choice.save).to eq(false)
		end
	end

	describe "Choice should have a User id" do
		scenario "Choice is saved with User id" do
			choice.choice = "Rock"
			choice.user_id = 1
			expect(choice.save).to eq(true)
		end

		scenario "Choice is saved without User id" do
			choice.choice = "Rock"
			expect(choice.save).to eq(false)
		end

	end
end


