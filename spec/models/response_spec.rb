require 'rails_helper'


describe Response do 

		it 'is invalid without a question_id' do
			expect(build(:response, question_id: nil)).to_not be_valid
		end

		# email tests

		it 'is invalid without an user_id' do
			expect(build(:response, user_id: nil)).to_not be_valid
		end


		it 'is invalid without a answer_choice_id' do
			expect(build(:response, answer_choice_id: nil)).to_not be_valid
		end


	# association tests

	it "should belong to a user" do 
		expect(build(:response)).to respond_to(:user)
	end

	it "should belong to a question" do 
		expect(build(:response)).to respond_to(:question)
	end

	it "should belong to an answer_choice" do 
		expect(build(:response)).to respond_to(:answer_choice)
	end

end