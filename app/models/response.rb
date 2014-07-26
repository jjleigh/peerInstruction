class Response < ActiveRecord::Base
	belongs_to :question
	belongs_to :user
	belongs_to :answer_choices
end
