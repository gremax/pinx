require 'rails_helper'

RSpec.describe Link, type: :model do
  before do
    @user = User.create!(username: 'Foobar', email: 'foobar@example.org',
                         password: 'password', password_confirmation: 'password')
  end

  it 'belongs to user' do
    @user.links.create!(url: 'http://example.com', title: 'Example URL')
    expect(@user.links.first.url).to eq 'http://example.com'
  end
end
