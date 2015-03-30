require 'rails_helper'

feature 'User edits a link' do
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

  scenario 'edit an exist bookmark' do
    click_link 'Edit'
    fill_in 'Site title',       with: 'Gooooooogle'
    fill_in 'Site description', with: 'Awesome search engine'
    click_button 'Save link'
    expect(page).to have_content('Gooooooogle')
    expect(page).to have_content('Awesome search engine')
  end
end