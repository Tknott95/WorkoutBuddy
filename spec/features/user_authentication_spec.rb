require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link ('Signup')

    fill_in 'first_name', with: 'bob'
    fill_in 'last_name', with: 'smith'
    fill_in 'email', with: 'bob@smith.com'
    fill_in 'password', with: 'sup3rs3krit'
    fill_in 'password confirmation', with: 'sup3rs3krit'

    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')

    expect(ActionMailer::Base.deliveries).to have(1).email
  end

  scenario 'allows existing user to login' do
    user = FactoryGirl.create(:user)

    visit '/'

    expect(page).to have_link('Login')

    click_link ('Login')

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    expect(page).to have_text("Signed in as #{user.email}")
  end

  scenario 'allows a logged in user to logout' do
    user = FactoryGirl.create(:user, password: 'sup3rs3krit')

    visit login_path

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Login'

    visit '/'

    expect(page).to have_text("Signed in as #{user.email}")
    expect(page).to have_link('Logout')

    click_link('Logout')

    expect(page).to have_text("#{user.email} has been logged out. ")
    expect(page).to_not have_text("Welcome back #{user.first_name.titleize}")
    expect(page).to_not hav_text("Signed in as #{user.email}")
  end
end
