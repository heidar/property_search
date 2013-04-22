require "spec_helper"

feature "Property index" do
  scenario "User requests a property index" do
    visit "/"
    expect(page).to have_text("Property Listing")
    expect(page).to have_text("Search")
    expect(page).to have_text("London house")
    expect(page).to have_text("London flat")
    expect(page).to have_text("London bunker")
    expect(page).to have_text("Norwich manor")
  end

  scenario "User searches properties with results" do
    visit "/"
    within '.span3' do
      fill_in 'name', with: 'London house'
      click_button 'search'
    end
    expect(page).to have_text("London house")
    expect(page).not_to have_text("London flat")
  end

  scenario "User searches properties with no results" do
    visit "/"
    within '.span3' do
      fill_in 'name', with: 'invalid search query'
      click_button 'search'
    end
    expect(page).to have_text("No results")
  end
end