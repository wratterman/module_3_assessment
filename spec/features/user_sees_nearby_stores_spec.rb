require 'rails_helper'

RSpec.feature "user can search a nearby stores by zip" do
  it "user sees all stores within 25 miles of zip" do
    # As a user
    # When I visit "/"
    visit "/"
    # And I fill in a search box with "80202" and click "search"
    fill_in :zipcode, with: "80202"
    click_on "Submit"
    # Then my current path should be "/search" (ignoring params)
    expect(current_path).to eq("/search")
    # And I should see stores within 25 miles of 80202
    # And I should see a message that says "17 Total Stores"
    expect(page).to have_css(".num_stores")
    # And I should see exactly 10 results (There are 17 stores within 25 miles. We want to display 10 on this page and 7 on the next. Get the first page to work first from start to finish and worry about pagination later.)
    expect(page).to have_css(".store")

    within first(".store") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".city")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".phone_number")
      expect(page).to have_css(".store_type")
    # And I should see the long name, city, distance, phone number and store type for each of the 10 results
    end
  end
end
