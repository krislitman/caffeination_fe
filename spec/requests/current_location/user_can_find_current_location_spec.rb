# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'As a guest', type: :feature do
  scenario 'When I visit the home page, I see a button to find my current location' do
    visit root_path
    within('#current_location') do
      button = find_button('button')
      expect(button).to be_an_instance_of(Capybara::Node::Element)
    end
  end

  scenario 'When I click button to find current location, I am redirected back to the home page with postal code entered' do
    VCR.use_cassette('requests/current_location') do
      visit root_path
      within('#current_location') do
        button = find_button('button')
        button.click
      end

      expect(current_path).to eq(root_path)
      within('#zipcode_search') do
        expect(page).to have_field('query', with: 'Denver')
      end
    end
  end
end
