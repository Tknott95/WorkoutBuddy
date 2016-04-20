require 'rails_helper'

feature 'User Authentication' do
  scenario 'allows a user to signup' do
    visit '/'

    expect(page).to have_link('Signup')

    click_link 'Signup'

    fill_in 'first_name', with: 'bob'
    fill_in 'last_name', with: 'smith'
    fill_in 'email', with: 'bob@smith.com'
    fill_in 'password', with: 'sup3rs3krit'
    fill_in 'password confirmation', with: 'sup3rs3krit'

    click_button 'Signup'

    expect(page).to have_text('Thank you for signing up Bob')
    expect(page).to have_text('Signed in as bob@smith.com')
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
end
