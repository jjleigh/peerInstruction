require 'rails_helper'

describe User do 

		it 'is invalid without a name' do
			expect(build(:user, name: nil)).to_not be_valid
		end

		# email tests

		it 'is invalid without an email' do
			expect(build(:user, email: nil)).to_not be_valid
		end

		# password tests
		it 'is invalid without a password' do
			expect(build(:user, password: nil)).to_not be_valid
		end
		it 'is invalid without a password' do
			expect(build(:user, password: "12345")).to_not be_valid
		end

		it 'is invalid without a password confirmation' do
			expect(build(:user, password_confirmation: nil)).to_not be_valid
		end


	# association tests

	it "should have many pictures" do 
		expect(build(:user)).to respond_to(:responses)
	end

	it "should have many pictures" do 
		expect(build(:user)).to respond_to(:questions)
	end


end