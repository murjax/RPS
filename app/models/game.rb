class Game < ActiveRecord::Base
	has_many :choices
	accepts_nested_attributes_for :choices, allow_destroy: true


	def set_winner
		choices = self.choices.map{ |c| c.choice }

		if choices[0] == "Rock" && choices[1] == "Scissors"
			self.winner_id = self.choices[0].user_id
		elsif choices[0] == "Scissors" && choices[1] == "Rock"
			self.winner_id = self.choices[1].user_id
		elsif choices[0] == "Paper" && choices[1] == "Rock"
			self.winner_id = self.choices[0].user_id
		elsif choices[0] == "Rock" && choices[1] == "Paper"
			self.winner_id = self.choices[1].user_id
		elsif choices[0] == "Scissors" && choices[1] == "Paper"
			self.winner_id = self.choices[0].user_id
		elsif choices[0] == "Paper" && choices[1] == "Scissors"
			self.winner_id = self.choices[1].user_id
		end

	end
end