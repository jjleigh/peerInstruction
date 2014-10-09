require 'Faker'

FactoryGirl.define do
	factory :question do
		description {Faker::Lorem.sentence}
		user_id 1
	end
end