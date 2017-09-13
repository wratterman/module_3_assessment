require 'rails_helper'

describe StoreList do
  context "it initializes" do
    it "with valid attrs" do
      valid_attrs = {
        total: 2,
        stores: [{
          longName: "Will",
          city: "Will's City",
          distance: 9.34,
          phone: "123-456-7890",
          storeType: "Nice Type"
          }, {
          longName: "Amy",
          city: "Paris(Texas)",
          distance: 1.34,
          phone: "303-636-1111",
          storeType: "Okay Type"
        }]
      }
      store = StoreList.new(valid_attrs)

      expect(store.total).to eq(2)

      expect(store.my_stores.first.name).to eq("Will")
      expect(store.my_stores.first.city).to eq("Will's City")
      expect(store.my_stores.first.distance).to eq(9.34)
      expect(store.my_stores.first.phone_number).to eq("123-456-7890")
      expect(store.my_stores.first.store_type).to eq("Nice Type")

      expect(store.my_stores.last.name).to eq("Amy")
      expect(store.my_stores.last.city).to eq("Paris(Texas)")
      expect(store.my_stores.last.distance).to eq(1.34)
      expect(store.my_stores.last.phone_number).to eq("303-636-1111")
      expect(store.my_stores.last.store_type).to eq("Okay Type")
    end
  end
end
