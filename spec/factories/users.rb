require 'Faker'

FactoryGirl.define do
	factory :user do
		email {Faker::Internet.email}
		name {Faker::Name.name}
		instructor true
		remember_me_token "hello"
		remember_me_token_expires_at {Faker::Date.forward(3)}
		password 'bobisbob'
		password_confirmation 'bobisbob'
	end
end