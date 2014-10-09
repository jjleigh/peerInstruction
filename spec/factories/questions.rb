require 'Faker'

FactoryGirl.define do
	factory :question do
		description {Faker::Lorem.sentence}
	end
end