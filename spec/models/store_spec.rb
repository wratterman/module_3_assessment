require 'rails_helper'

describe Store do
  context "it initializes" do
    it "with valid attrs" do
      valid_attrs = {
        longName: "Will",
        city: "Will's City",
        distance: 9.34,
        phone: "123-456-7890",
        storeType: "Nice Type"
      }
      store = Store.new(valid_attrs)

      expect(store.name).to eq("Will")
      expect(store.city).to eq("Will's City")
      expect(store.distance).to eq(9.34)
      expect(store.phone_number).to eq("123-456-7890")
      expect(store.store_type).to eq("Nice Type")
    end

    it "with different attrs" do
      valid_attrs = {
        longName: "Amy",
        city: "Paris(Texas)",
        distance: 1.34,
        phone: "303-636-1111",
        storeType: "Okay Type"
      }
      store = Store.new(valid_attrs)

      expect(store.name).to eq("Amy")
      expect(store.city).to eq("Paris(Texas)")
      expect(store.distance).to eq(1.34)
      expect(store.phone_number).to eq("303-636-1111")
      expect(store.store_type).to eq("Okay Type")
    end
  end
end
