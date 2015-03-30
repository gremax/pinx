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

  it 'has many links, which can be destroyed with user' do
    @user.save
    @user.links.create!(url: 'http://example.com', title: 'Example URL')
    expect(@user.links.count).to eq 1
    @user.links.create!(url: 'http://example.com', title: 'Example URL')
    expect(@user.links.count).to eq 2
    @user.destroy
    expect(Link.where(user_id: @user.id).count).to eq 0
  end
end
