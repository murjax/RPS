FactoryGirl.define do
  factory :game do

  	factory :new_game do
  		player_one_id 1
  	end

  	factory :active_game do 
  		after(:create) do |game|
	  		create(:rock, game: game)
	  	end
	  	player_one_id 1
	  	player_two_id 2
  	end
  	
  end
end
