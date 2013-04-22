require "spec_helper"

feature "Property details" do
  scenario "User requests a property" do
    visit "/property/1"
    expect(page).to have_text("Property Details")
    expect(page).to have_text("Search")
    expect(page).to have_text("Similar Properties")
  end

  scenario "User requests a property with similar properties" do
    visit "/property/1"
    expect(page).to have_text("Similar Properties")
    expect(page).to have_text("London house")
    expect(page).to have_text("London flat")
    expect(page).to have_text("London bunker")
    expect(page).not_to have_text("Norwich manor")
  end

  scenario "User requests a property with no similar properties" do
    visit "/property/4"
    expect(page).to have_text("Property Details")
    expect(page).to have_text("Search")
    expect(page).to have_text("Similar Properties")
    expect(page).to have_text("Norwich manor")
    expect(page).to have_text("There are no similar properties")
  end

end