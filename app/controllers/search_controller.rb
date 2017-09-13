
class SearchController < ApplicationController

  def index
    @stores = StoreList.find_by(params[:zipcode])
  end
end
