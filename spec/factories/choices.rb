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
    
  end
end
