class AnswerChoice < ActiveRecord::Base
	belongs_to :question
	has_and_belongs_to_many :users

# need to create a custom validation to prevent a user from voting twice
	# after_vote :validate_number_of_responses

	# private
	# def validate_number_of_responses
	# 	if current_user
	# 		errors.add(:users, "You have already voted")
	# 		return false
	# 	end
	# end

end
