require 'rails_helper'

describe "Items API" do
  it "sends a list of items with JSON 200 respons" do
    item1 = create(:item)
    item2 = create(:item, name: "Item2")

    get "/api/v1/items"

    expect(response).to have_status_code(:ok)
    expect(response).to be_success

    raw_items = JSON.parse(response.body, symbolize_names: true)

    expect(raw_items.first[:id]).to eq(item1.id)
    expect(raw_items.last[:id]).to eq(item2.id)
  end
end

# When I send a GET request to `/api/v1/items`
# I receive a 200 JSON response containing all items
# And each item has an id, name, description, and image_url but not the created_at or updated_at
#
# When I send a GET request to `/api/v1/items/1`
# I receive a 200 JSON response containing the id, name, description, and image_url but not the created_at or updated_at
#
# When I send a DELETE request to `/api/v1/items/1`
# I receive a 204 JSON response if the record is successfully deleted
#
# When I send a POST request to `/api/v1/items` with a name, description, and image_url
# I receive a 201 JSON  response if the record is successfully created
# And I receive a JSON response containing the id, name, description, and image_url but not the created_at or updated_at
