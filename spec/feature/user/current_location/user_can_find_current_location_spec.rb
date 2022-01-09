require 'rails_helper'

RSpec.describe 'As a guest', type: :feature do
  scenario 'When I visit the home page, I see a button to find my current location' do
    visit root_path

    button = find(:xpath, "/html/body/div[1]/main/div[2]/form/button")

    expect(button).to be_an_instance_of(Capybara::Node::Element)
  end

  scenario 'When I click button to find current location, I am redirected back to the home page with postal code entered' do
    visit root_path

    find(:xpath, "/html/body/div[1]/main/div[2]/form/button").click

    test_location = CurrentLocationService.get_current_location

    expect(current_path).to eq(root_path)
    within("#zipcode_search") do
      expect(page).to have_content(test_location)
    end
  end
end
