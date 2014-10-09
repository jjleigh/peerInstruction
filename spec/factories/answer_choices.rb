require 'Faker'

FactoryGirl.define do
	factory :answer_choice do
		description {Faker::Lorem.word}
		question_id 1		
	end
end