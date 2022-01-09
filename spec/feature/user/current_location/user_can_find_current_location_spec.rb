require 'rails_helper'

RSpec.describe 'As a guest', type: :feature do
  scenario 'When I visit the home page, I see a button to find my current location' do
    visit root_path

    expect(page).to have_button('Find My Location')
  end
end
