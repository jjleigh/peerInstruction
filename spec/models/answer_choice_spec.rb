require 'rails_helper'

describe AnswerChoice do 

		it 'is invalid without a description' do
			expect(build(:answer_choice, description: nil)).to_not be_valid
		end

		it 'is invalid without an user_id' do
			expect(build(:answer_choice, question_id: nil)).to_not be_valid
		end

	# association tests

	it "should belong to a question" do 
		expect(build(:answer_choice)).to respond_to(:question)
	end

	it "should have many users" do 
		expect(build(:answer_choice)).to respond_to(:users)
	end

	it "should have many responses" do 
		expect(build(:answer_choice)).to respond_to(:responses)
	end

end