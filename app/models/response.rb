class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :answer_choices

# first try 
	# validates :user_id, uniqueness: true


# second try - throws an error due to params not being accessible in the model
	# validates :response, :respond_once => false
	# def respond_once
	# 	@response = Response.find(params[:id])

	# 	if @response.question_id.user_id.exist?
	# 		errors.add("You have already placed a vote")
	# 	end
	# end

# third try - this also doesnt work
	# validates :response, :user_can_only_respond_once => false
	# def user_can_only_respond_once
	# 	Response.each do |r|
	# 		if r.question_id.user_id.exist?
	# 			errors.add("You have already placed a vote")
	# 		end
	# 	end	
	#  end


# fourth try - this doesnt return an error but it doesnt work.
	# validates :response, :respond_once => false
	# 	def respond_once
	# 		return Response.find(:first,:conditions => {:question_id => question_id, :user_id => user_id})
	# 	end
# fifth try - 
	# class MyValidator < ActiveModel::Validator
	# 	def validate
	# 		@response.each do |r|
	# 		if r.question_id.user_id.exist?
	# 			errors.add("You have already placed a vote")
	# 		end
	# 	end
# sixth try

	# include ActiveModel::EachValidatior

	# validates_with ResponseValidator
	# end 
end
