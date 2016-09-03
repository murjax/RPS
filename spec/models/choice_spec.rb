require 'rails_helper'
describe "Choice" do 
	describe "Choice should be either 'Rock', 'Paper', or 'Scissors'" do
		scenario "Choice is Rock" do 
			rock = create(:rock)
			rock.choice = "Rock"
			rock.user_id = 1
			expect(rock.save).to eq(true)
		end

		scenario "Choice is Scissors" do
			scissors = create(:scissors)
			scissors.choice = "Scissors"
			scissors.user_id = 2
			expect(scissors.save).to eq(true)
		end

		scenario "Choice is Paper" do
			paper = create(:paper)
			paper.choice = "Paper"
			paper.user_id = 2
			expect(paper.save).to eq(true)
		end

		scenario "Choice is Tree" do
			tree = Choice.new(user_id: 1, choice: "Tree")
			expect(tree).to_not be_valid
		end
	end

	describe "Choice should have a User id" do
		scenario "Choice is saved with User id" do
			rock = create(:rock)
			rock.choice = "Rock"
			expect(rock.save).to eq(true)
		end

		scenario "Choice is saved without User id" do
			rock = create(:rock)
			rock.choice = "Rock"
			rock.user_id = nil
			expect(rock.save).to eq(false)
		end

	end
end


