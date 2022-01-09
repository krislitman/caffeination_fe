require 'rails_helper'

RSpec.describe 'As a guest', type: :feature do
  scenario 'When I visit the home page, I see a button to find my current location' do
    visit root_path

    button = find(:xpath, "/html/body/div[1]/main/div[2]/form/button")

    expect(button).to be_an_instance_of(Capybara::Node::Element)
  end
end
