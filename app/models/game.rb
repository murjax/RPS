class Game < ActiveRecord::Base
  has_many :choices
  accepts_nested_attributes_for :choices, allow_destroy: true
  validate :number_of_choices

  def set_winner
    choices = self.choices.map{ |c| c.choice }
    if !same?(choices)
      winner_index = first_choice_wins?(choices) ? 0 : 1
      self.winner_id = self.choices[winner_index].user_id
      increase_winner_rating
    end
  end

  def number_of_choices
    if self.choices.size > 2
      errors.add(:choices, "Invalid number of choices")
    end
  end

  private

  def first_choice_wins?(choices)
    winning_options = {"Rock" => "Scissors", "Paper" => "Rock", "Scissors" => "Paper"}
    winning_options[choices[0]] == choices[1] ? true : false
  end

  def same?(choices)
    choices.uniq.length == 1 ? true : false
  end

  def increase_winner_rating
    winner = User.find(self.winner_id)
    winner.increase_rating
    winner.save
  end

end