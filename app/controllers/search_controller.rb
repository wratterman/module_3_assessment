class SearchController < ApplicationController

  def index
    @store = StoreList.find_by(params[:zipcode])
  end
end
