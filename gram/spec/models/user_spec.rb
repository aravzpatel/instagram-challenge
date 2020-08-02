require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should only allow unique usernames to be registered' do
    user = User.create(username: 'arav', password_digest: 'a;dlkfjad;k', email: 'a@a.com')

    duplicate_user = User.new(username: 'arav', password_digest: 'ad;lfkajd;', email: 'a@a.com')

    duplicate_user.should_not be_valid

    duplicate_user.errors[:username].should include("has already been taken")
  end

  it 'should only allow unique emails to be registered' do
    user = User.create(username: 'arav', password_digest: 'a;dlkfjad;k', email: 'a@a.com')

    duplicate_user = User.new(username: 'arav', password_digest: 'ad;lfkajd;', email: 'a@a.com')

    duplicate_user.should_not be_valid

    duplicate_user.errors[:email].should include("has already been taken")
  end

  it 'should only allow passwords greater than 6 characters to be registered' do

    user = User.new(username: 'arav', password_digest: 'a', email: 'a@a.com')

    user.should_not be_valid

    expect(user.errors[:password_digest]).to eq(["is too short (minimum is 6 characters)"])
  end

  it 'should only allow usernames greater than 4 characters to be registered' do

    user = User.new(username: 'a', password_digest: 'a', email: 'a@a.com')

    user.should_not be_valid

    expect(user.errors[:username]).to eq(["is too short (minimum is 4 characters)"])
  end

end
