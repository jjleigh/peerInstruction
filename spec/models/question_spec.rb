require 'rails_helper'

describe Question do 

		it 'is invalid without a description' do
			expect(build(:question, description: nil)).to_not be_valid
		end

		it 'is invalid without an user_id' do
			expect(build(:question, user_id: nil)).to_not be_valid
		end

	# association tests

	it "should belong to a user" do 
		expect(build(:question)).to respond_to(:user)
	end

	it "should have many answer_choice" do 
		expect(build(:question)).to respond_to(:answer_choices)
	end

	it "should have many responses" do 
		expect(build(:question)).to respond_to(:responses)
	end

end