# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  scenario 'When I visit the app, I see buttons to log in or sign up as a new user, and able to search' do
    visit root_path

    expect(page).to have_content('CAFFEINATION')

    within '#zipcode_search' do
      expect(page).to have_content('Where would you like to grab coffee?')
      expect(page).to have_field(:query)
    end
  end

  scenario 'When I click on ~Sign up~, I am brought to a page to enter more information' do
    visit root_path
    find(:xpath, '/html/body/nav/div/div/div/ul/li[2]/ul/a[3]').click

    expect(current_path).to eq(sign_up_path)
    within '#sign_up_form' do
      expect(page).to have_field(:username)
      expect(page).to have_field(:password)
      expect(page).to have_field(:first_name)
      expect(page).to have_field(:last_name)
      expect(page).to have_field(:line1)
      expect(page).to have_field(:line2)
      expect(page).to have_field(:city)
      expect(page).to have_field(:state)
      expect(page).to have_field(:postal_code)
      expect(page).to have_field(:country)
      expect(page).to have_field(:email)
      expect(page).to have_field(:favorite_beverage)
      expect(page).to have_button('Sign me up')
    end
  end

  scenario 'When I enter my information and sign up, I am redirected to my personal page' do
    visit sign_up_path

    within '#sign_up_form' do
      username = page.find(:field, :username)
      password = page.find(:field, :password)
      first_name = page.find(:field, :first_name)
      last_name = page.find(:field, :last_name)
      line1 = page.find(:field, :line1)
      line2 = page.find(:field, :line2)
      city = page.find(:field, :city)
      state = page.find(:field, :state)
      postal_code = page.find(:field, :postal_code)
      email = page.find(:field, :email)
      favorite_beverage = page.find(:field, :favorite_beverage)

      username.fill_in with: 'duguy8'
      password.fill_in with: 'Test123!'
      first_name.fill_in with: 'kris'
      last_name.fill_in with: 'litman'
      line1.fill_in with: '5145 S Dale Mabry Hwy'
      line2.fill_in with: 'Unit 107'
      city.fill_in with: 'Tampa'
      state.fill_in with: 'FL'
      postal_code.fill_in with: '33611'
      email.fill_in with: 'Kris.d.litman@gmail.com'
      favorite_beverage.fill_in with: 'Nitro cold brew'

      click_button 'Sign me up'
    end

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Welcome duguy8')
    expect(page).to have_content('Find, save and share your favorite coffee spots!')
    expect(page).to have_content('Where would you like to grab coffee?')
  end
end
