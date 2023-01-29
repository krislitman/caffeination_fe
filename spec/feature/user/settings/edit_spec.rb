# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
  before do
    @address = create :address
    @user = @address.user

    log_in @user
    visit edit_user_path(@user)
  end

  context 'When visiting my settings page' do
    it 'shows user settings' do
      expect(page).to have_content 'Settings'

      expect(page).to have_content 'Username'
      expect(page).to have_field :user_username

      expect(page).to have_content 'First Name'
      expect(page).to have_field :user_first_name

      expect(page).to have_content 'Last Name'
      expect(page).to have_field :user_last_name

      expect(page).to have_content 'Enter your Address 1'
      expect(page).to have_field :user_line1

      expect(page).to have_content 'Enter your Address 2'
      expect(page).to have_field :user_line2

      expect(page).to have_content 'Enter your City'
      expect(page).to have_field :user_city

      expect(page).to have_content 'Enter your State'
      expect(page).to have_field :user_state

      expect(page).to have_content 'Enter your Postal Code'
      expect(page).to have_field :user_postal_code

      expect(page).to have_content 'Enter your Email'
      expect(page).to have_field :user_email

      expect(page).to have_content 'Enter your Favorite Beverage'
      expect(page).to have_field :user_favorite_beverage

      expect(page).to have_button 'Update Settings'
    end

    context 'and update fields' do
      let(:new_username) { 'Gordan Ramsey' }

      it 'saves the values for the current user' do
        fill_in :user_first_name, with: new_username
        click_button 'Update Settings'

        expect(current_path).to eq(edit_user_path(@user))
        expect(@user.reload.first_name).to eq(new_username)
      end
    end
  end
end
