class Question < ActiveRecord::Base
	has_many :answer_choices, dependent: :destroy
	has_many :responses, through: :answer_choices, dependent: :destroy
	belongs_to :user

	accepts_nested_attributes_for :answer_choices, :reject_if => :all_blank, :allow_destroy => true

	validates :description, :user_id, :presence => true 
end
