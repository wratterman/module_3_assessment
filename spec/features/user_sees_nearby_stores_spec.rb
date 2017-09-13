require 'rails_helper'

RSpec.feature "user can search a nearby stores by zip" do
  it "user sees all stores within 25 miles of zip" do
    visit "/"
    zip = ["80202", "80122", "80209"].sample
    fill_in :zipcode, with: zip
    click_on "Submit"

    expect(current_path).to eq("/search")

    expect(page).to have_css(".num_stores")
    expect(page).to have_css(".store")

    within first(".store") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".city")
      expect(page).to have_css(".distance")
      expect(page).to have_css(".phone_number")
      expect(page).to have_css(".store_type")
    end
  end
end
