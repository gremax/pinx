require 'rails_helper'

feature 'User deletes a link' do
  before do
    @user = User.create!(username: 'Foobar', email: 'foobar@example.org',
                         password: 'password', password_confirmation: 'password')
    visit signin_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content("Welcome back, #{@user.username}")
    click_link 'Add link'
    fill_in 'Site url', with: 'http://google.com'
    click_button 'Add link'
    expect(page).to have_content('Google')
  end

  scenario 'delete an exist bookmark' do
    click_link 'Delete'
    expect(page).to_not have_content('Google')
  end
end