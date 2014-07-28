class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :answer_choices



	validates :user_id, :uniqueness => {:scope => :question_id, :message => "You have already placed a vote"}


#this does the same thing as the method below. Just saving it as an example of a secon way to do it.

	# validate :user_can_only_vote_once

	# def user_can_only_vote_once
	# 	if Response.where(:question_id => question_id).where(:user_id => user_id)
	# 		errors.add(:response, "You have already placed a vote")
	# 	end
	# end
end
