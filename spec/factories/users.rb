FactoryGirl.define do
	factory :user do
    sequence(:email) {|n| "user#{n}@example.com" }
    password "Pahswahd"
    username "Iahmahsahme"

    factory :user_two do 
    	email "userdos@example.com"
    	password "password321"
    	username "rockman"
    end
  end
end