# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a visitor', type: :feature do
  before :all do
    @user = FactoryBot.create(:user)
  end
  after :all do
    User.find(@user.id).destroy
  end

  context 'When I visit the home page' do
    it 'I visit the correct page when clicking Log in button' do
      visit root_path
      find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[2]/ul/a[1]').click

      expect(current_path).to eq(log_in_path)
    end
    it 'The log in page asks for my email address and password' do
      visit log_in_path

      within '#log_in_form' do
        expect(page).to have_field(:email)
        expect(page).to have_field(:password)
      end
    end
    it 'With correct credentials I am able to log in, redirected to root path' do
      visit log_in_path
      email = page.find(:field, :email)
      password = page.find(:field, :password)
      email.fill_in with: @user.email
      password.fill_in with: @user.password
      click_button 'Sign In'

      expect(current_path).to eq(root_path)
      expect(page).to have_content("Welcome back #{@user.username}!")
    end
    it 'With incorrect credentials, I see a notice that I was unable to login, and returned to login page' do
      visit log_in_path
      email = page.find(:field, :email)
      password = page.find(:field, :password)
      email.fill_in with: 'what_is_this@something.com'
      password.fill_in with: 'bestpassword'
      click_button 'Sign In'

      expect(current_path).to eq(log_in_path)
      expect(page).to have_content("Couldn't log you in :(")
    end
  end
end
