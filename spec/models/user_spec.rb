require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(username: 'Foobar', email: 'foobar@example.org',
                     password: 'password', password_confirmation: 'password')
  end

  it 'username can\'t be blank' do
    @user.username = ' '
    expect(@user).to be_invalid
  end

  it 'email can\'t be blank' do
    @user.email = ' '
    expect(@user).to be_invalid
  end

  it 'username is too long' do
    @user.username = "a" * 31
    expect(@user).to be_invalid
  end
end
