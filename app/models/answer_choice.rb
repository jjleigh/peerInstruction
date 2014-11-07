class AnswerChoice < ActiveRecord::Base
	belongs_to :question

	has_many :responses, dependent: :destroy
	has_many :users, through: :responses, dependent: :destroy

	validates :description, :presence => true
end
