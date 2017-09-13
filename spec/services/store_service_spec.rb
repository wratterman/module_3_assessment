require 'rails_helper'

describe StoreService do
  context "class methods" do
    it "returns the stores within 25 miles of provided zip" do
      zip = "80202"

      raw_stores = StoreService.get_nearby_stores(zip)
      raw_store  = raw_stores.first

      expect(raw_stores.count).to eq(17)
      expect(raw_stores).to be_a(Array)

      expect(raw_store).to have_key(:longName)
      expect(raw_store[:longName]).to be_a(String)

      expect(raw_store).to have_key(:city)
      expect(raw_store[:city]).to be_a(String)

      expect(raw_store).to have_key(:distance)
      expect(raw_store[:distance]).to be_a(Float)

      expect(raw_store).to have_key(:storeType)
      expect(raw_store[:storeType]).to be_a(String)

      expect(raw_store).to have_key(:phone)
      expect(raw_store[:phone]).to be_a(String)
    end
  end
end
