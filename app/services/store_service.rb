class StoreService

  def initialize(zip)
    @base   = "https://api.bestbuy.com/v1/stores(area("
    @key    = ENV["API_KEY"]
    @zip    = zip
    @params = ",25))?format=json&show=longName,city,distance,phone,storeType&"
  end

  def self.get_nearby_stores(zip)
    new(zip).get_stores
  end

  def get_stores
    get_url(base + zip + params + "apiKey=#{key}")
  end

  private

  attr_reader :base, :key, :zip, :params

  def get_url(url)
    response = Faraday.get(url)
    JSON.parse(response.body, symbolize_names: true)[:stores]
  end
end
