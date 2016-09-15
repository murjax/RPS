FactoryGirl.define do
  factory :game do

  	factory :new_game do
  	end

  	factory :active_game do 
  		after(:create) do |game|
	  		create(:rock, game: game)
	  	end
  	end

    factory :finished_game do
      after(:create) do |game|
        create(:rock, game: game)
        create(:paper, game: game)
      end
    end
  	
  end
end
