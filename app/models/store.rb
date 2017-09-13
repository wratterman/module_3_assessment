class Store

  def find_by(zip)
    StoreService.get_nearby_stores(zip)
  end
end
