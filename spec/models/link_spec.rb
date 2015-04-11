require 'rails_helper'

RSpec.describe Link, type: :model do
  before do
    @user = FactoryGirl.create(:user)
    @link = @user.links.create!(url: 'http://example.com', 
                                title: '  Example URL  ',
                                about: '  Description with spaces  ')
  end

  it 'belongs to user' do
    expect(@link.url).to     eq 'http://example.com'
    expect(@link.user_id).to eq @user.id
  end

  it 'title should be without spaces' do
    expect(@link.title).to eq 'Example URL'
  end

  it 'description should be without spaces' do
    expect(@link.about).to eq 'Description with spaces'
  end
end
