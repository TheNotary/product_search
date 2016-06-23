require 'rails_helper'


feature 'Home page' do

  # Scenario: Visit the home page
  #   Given I am a visitor
  #   When I visit the home page
  #   Then I see the string "search" somewhere
  scenario 'visit the home page' do
    visit root_path
    expect(page).to have_content 'search'
  end

  scenario 'visitors can run searches against the frontend', js: true do
    visit root_path
    fill_in 'query', :with => 'Samsung Galaxy'
    click_button('Search')
    expect(page).to have_content("Samsung Galaxy Tab A 7")
  end

end
