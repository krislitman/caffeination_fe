# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a logged in user', type: :feature do
  before :all do
    @user = create :user
    log_in @user
  end

  context 'When I visit the home page' do
    it 'I can log out after clicking the button' do
      visit root_path
      find(:xpath, '//*[@id="navbarSupportedContent"]/ul/li[2]/ul/a[2]').click

      expect(current_path).to eq(root_path)
      expect(page).to have_content('You have been logged out')
    end
  end
end
