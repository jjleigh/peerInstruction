class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :answer_choice



	validates :user_id, :uniqueness => {:scope => :question_id, :message => "You have already placed a vote"}
	validates :user_id, :question_id, :answer_choice, :presence => true

#this does the same thing as the method below. Just saving it as an example of a second way to do it.

	# validate :user_can_only_vote_once

	# def user_can_only_vote_once
	# 	if Response.where(:question_id => question_id).where(:user_id => user_id)
	# 		errors.add(:response, "You have already placed a vote")
	# 	end
	# end
end
