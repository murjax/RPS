class Game < ActiveRecord::Base
	has_many :choices
	accepts_nested_attributes_for :choices, allow_destroy: true
end