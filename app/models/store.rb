class Store

  attr_reader :name, :city, :distance, :phone_number, :store_type

  def initialize(raw_store)
    @name         = raw_store[:longName]
    @city         = raw_store[:city]
    @distance     = raw_store[:distance]
    @phone_number = raw_store[:phone]
    @store_type   = raw_store[:storeType]
  end
end
