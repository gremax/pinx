require 'rails_helper'

feature 'User creates a link' do
  before do
    user = FactoryGirl.create(:user)
    visit signin_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign in'
    expect(page).to have_content("Welcome back, #{user.username}")
  end

  scenario 'add a new bookmark with a blank field' do
    click_link 'Add link'
    click_button 'Add link'
    expect(page).to have_content('can\'t be blank')
  end

  scenario 'add a new bookmark with an invalid URL' do
    click_link 'Add link'
    fill_in 'Site url', with: 'httpp://'
    click_button 'Add link'
    expect(page).to have_content('is not a valid URL')
  end

  scenario 'add a new bookmark with valid URL' do
    click_link 'Add link'
    fill_in 'Site url', with: 'http://google.com'
    click_button 'Add link'
    expect(page).to have_content('Google')
  end
end