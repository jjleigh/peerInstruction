class Question < ActiveRecord::Base
	has_many :answer_choices, dependent: :destroy
	has_many :responses, through: :answer_choices, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :answer_choices, :reject_if => :all_blank, :allow_destroy => true
	
	validates :description, :user_id, :presence => true
	validate :require_minimum_two_answer_choices

	private
	def require_minimum_two_answer_choices
		errors.add(:base, "You must provide at least two answers") if answer_choices.size < 2
	end
end
