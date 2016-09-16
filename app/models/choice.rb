class Choice < ApplicationRecord
  belongs_to :game
  validates_inclusion_of :choice, :in => %w(Rock Paper Scissors), :message => "Invalid choice"
  validates :user_id, presence: true
end
