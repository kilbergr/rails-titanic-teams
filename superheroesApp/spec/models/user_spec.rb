require 'rails_helper'

describe User do
	it { is_expected.to respond_to :username, :password, :password_digest }

end


 describe 'username when it is invalid' do
    subject(:invalid_username) { User.create(username:"")}
    it { is_expected.to_not be_valid}
	end

	 describe 'password when it is invalid' do
    subject(:invalid_password) { User.create(username:"r", password:"")}
    it { is_expected.to_not be_valid}
	end

 describe 'signin when it is valid' do
    subject(:valid_login) { User.create(username:"r", password:"rek", password_digest:"rek")}
    it { is_expected.to be_valid}
	end

	describe 'user has teams' do
		subject(:team) {Team.create(name:"super", description:"super team", user_id: 1)}
		it {is_expected.to be_valid}
	end

		describe 'teams invalid without user' do
		subject(:team) {Team.create(name:"super", description:"super team")}
		it {is_expected.to_not be_valid}
	end


describe Team do
  it { should belong_to(:user) }
  it {should have_many(:superheroes)}
  it { should validate_presence_of(:name) }
end

describe User do
	it {should have_many(:teams)}
end

describe Superhero do
	it { should have_many(:teams)}
end



