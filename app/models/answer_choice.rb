class AnswerChoice < ActiveRecord::Base
	belongs_to :question
	has_and_belongs_to_many :users

# need to create a custom validation to prevent a user from voting twice
	# after_vote :validate_number_of_responses
	# validate :validate_number_of_responses

	# private
	# def validate_number_of_responses
	
	# 	answers_belongs_to_current_questions = AnswerChoice.where(question_id: question.id)
	# 	answers_belongs_to_current_questions.each{|answer|
	# 		answer.users.each{|user|
	# 			if user.id == users[0].id
	# 					puts "Error"
	# 					errors.add(:users, "You have already voted")
				
	# 			end
	# 		}
	# 	}
	# end

end
