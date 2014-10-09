require 'Faker'

FactoryGirl.define do
	factory :response do
		user_id 1
		question_id 1
		answer_choice_id 1
	end
end