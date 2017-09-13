require 'rails_helper'

describe "Items API" do
  it "gets a list of items with 200 response" do
    item1 = create(:item)
    item2 = Item.create(name: "Item2", description: "Desc 2",
                        image_url: "iamge2.jpg")

    get "/api/v1/items"

    expect(response).to be_success
    expect(response.status).to eq(200)

    raw_items = JSON.parse(response.body, symbolize_names: true)

    expect(raw_items.first[:id]).to eq(item1.id)
    expect(raw_items.first[:name]).to eq(item1.name)
    expect(raw_items.first[:description]).to eq(item1.description)
    expect(raw_items.first[:image_url]).to eq(item1.image_url)
    expect(raw_items.last[:id]).to eq(item2.id)
    expect(raw_items.last[:name]).to eq(item2.name)
    expect(raw_items.last[:description]).to eq(item2.description)
    expect(raw_items.last[:image_url]).to eq(item2.image_url)
  end

  it "gets a specfic item with a 200 response" do
    item1 = create(:item)
    item2 = Item.create(name: "Item2", description: "Desc 2",
                        image_url: "iamge2.jpg")

    get "/api/v1/items/#{item1.id}"

    expect(response).to be_success
    expect(response.status).to eq(200)

    raw_item = JSON.parse(response.body, symbolize_names: true)

    expect(raw_item[:id]).to eq(item1.id)
    expect(raw_item[:id]).to_not eq(item2.id)

    expect(raw_item[:name]).to eq(item1.name)
    expect(raw_item[:name]).to_not eq(item2.name)

    expect(raw_item[:description]).to eq(item1.description)
    expect(raw_item[:description]).to_not eq(item2.description)

    expect(raw_item[:image_url]).to eq(item1.image_url)
    expect(raw_item[:image_url]).to_not eq(item2.image_url)

    get "/api/v1/items/#{item2.id}"

    expect(response).to be_success
    expect(response.status).to eq(200)

    raw_item = JSON.parse(response.body, symbolize_names: true)

    expect(raw_item[:id]).to eq(item2.id)
    expect(raw_item[:id]).to_not eq(item1.id)

    expect(raw_item[:name]).to eq(item2.name)
    expect(raw_item[:name]).to_not eq(item1.name)

    expect(raw_item[:description]).to eq(item2.description)
    expect(raw_item[:description]).to_not eq(item1.description)

    expect(raw_item[:image_url]).to eq(item2.image_url)
    expect(raw_item[:image_url]).to_not eq(item1.image_url)
  end

  it "deletes a specfic item with a 204 response" do
    item_id = create(:item).id
    expect(Item.count).to eq(1)

    delete "/api/v1/items/#{item_id}"

    expect(response).to be_success
    expect(response.status).to eq(204)
    expect(Item.count).to eq(0)
  end

  it "creates a new item with a 201 response" do
    expect(Item.count).to eq(0)

    get "/api/v1/items?name=Joe&description=cool&image_url=abc.com"

    expect(response).to be_success
    expect(response.status).to eq(201)
    expect(Item.count).to eq(1)

    new_item = JSON.parse(response.body, symbolize_names: true)

    expect(new_item[:name]).to eq("Joe")
    expect(new_item[:name]).to eq(Destination.last.name)
    expect(new_item[:description]).to eq("cool")
    expect(new_item[:description]).to eq(Destination.last.description)
    expect(new_item[:image_url]).to eq("abc.com")
    expect(new_item[:image_url]).to eq(Destination.last.image_url)
    expect(new_item[:id]).to eq(Destination.last.id)
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
