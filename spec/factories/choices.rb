FactoryGirl.define do
  factory :choice do

  	factory :rock do
  		user_id 1
  		choice "Rock"
  	end

  	factory :paper do
  		user_id 2
  		choice "Paper"
  	end

    factory :scissors do
      user_id 2
      choice "Scissors"
    end

    factory :tree do
      user_id 1
      choice "Tree"
    end
    
  end
end
