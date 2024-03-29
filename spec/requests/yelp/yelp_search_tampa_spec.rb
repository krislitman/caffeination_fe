# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Yelp API call initial test', type: :feature do
  after(:each) do
    CoffeeShop.destroy_all
  end

  xdescribe 'A guest can enter a zipcode into form' do
    it 'Can search for local coffee shops' do
      VCR.use_cassette('requests/yelp_initial_test',
                       match_requests_on: %i[body]) do
        visit root_path
        fill_in :query, with: '33602'
        within('#zipcode_search') do
          page.find_button('button').click
        end
        expect(current_path).to eq(search_path)
        expect(page).to have_content('Caffeination')
      end
    end
  end
end
