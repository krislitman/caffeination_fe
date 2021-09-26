require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  scenario 'When I visit the app, I see buttons to log in or sign up as a new user, and able to search' do
    visit root_path

    expect(page).to have_content('Caffeination')
    within '#user_options' do
      expect(page).to have_button('Sign up')
      expect(page).to have_button('Log in')
    end
    within '#zipcode_search' do
      expect(page).to have_content('Where would you like to grab coffee?')
      expect(page).to have_field(:query)
    end
  end
  scenario 'When I click on ~Sign up~, I am brought to a page to enter more information' do
    visit root_path
    click_button 'Sign up'

    expect(current_path).to eq(sign_up_index_path)
    within '#sign_up_form' do
      expect(page).to have_field(:first_name)
      expect(page).to have_field(:last_name)
      expect(page).to have_field(:address_1)
      expect(page).to have_field(:address_2)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)
      expect(page).to have_field(:zipcode)
      expect(page).to have_field(:email)
      expect(page).to have_field(:favorite_beverage)
    end
  end
end
