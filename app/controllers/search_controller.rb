class SearchController < ApplicationController

  def index
    @stores = Store.find_by(params[:zipcode])
  end
end
