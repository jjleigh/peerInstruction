class AnswerChoice < ActiveRecord::Base
	belongs_to :question

	has_many :responses, dependent: :destroy
	has_many :users, through: :responses, dependent: :destroy

	validates :question_id, :description, :presence => true
end
