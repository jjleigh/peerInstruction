# this is a custom validator which will validate that the user only responded to each question once.
class ResponseValidator < ActiveModel::EachValidator

# this method validates that a user only responded once
	# def respond_only_once
	# 	if @response.question_id.exists?
	# 		record.errors[attribute] << (options[:message] || "Users may only respond once.")
	# 	end
	# end
end 