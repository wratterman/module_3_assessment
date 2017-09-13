class StoreList

  attr_reader :total, :my_stores

  def initialize(list)
    @total  = list[:total]
    @my_stores = format_stores(list[:stores])
  end

  def self.find_by(zip)
    StoreList.new(StoreService.get_nearby_stores(zip))
  end

  private

  def format_stores(stores)
    stores.map do |store|
      Store.new(store)
    end
  end
end
