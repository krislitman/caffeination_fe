require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  scenario 'When I visit the app, I see buttons to log in or sign up as a new user, and able to search' do
    visit root_path

    expect(page).to have_content('Caffeination')
    expect(page).to have_button('Sign up')
    expect(page).to have_button('Log in')
    within '#zipcode_search' do
      expect(page).to have_content('Where would you like to grab coffee?')
      expect(page).to have_field('zipcode')
    end
  end
end
