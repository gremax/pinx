require 'rails_helper'

feature 'User signin' do
  before do
    @user = User.create!(username: 'Foobar', email: 'foobar@example.org',
                         password: 'password', password_confirmation: 'password')
    visit signup_path
    click_on ('Already have an account')
  end

  scenario 'with valid information' do
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    click_button 'Sign in'
    expect(page).to have_content("Welcome back, #{@user.username}")
  end

  scenario 'with invalid information' do
    click_button 'Sign in'
    expect(page).to have_content('Invalid combination')
  end
end