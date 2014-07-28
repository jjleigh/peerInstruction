class Question < ActiveRecord::Base
	has_many :answer_choices
	has_many :responses, through: :answer_choices

	accepts_nested_attributes_for :answer_choices, :reject_if => :all_blank, :allow_destroy => true

	validates :question, :presence => true 
end
