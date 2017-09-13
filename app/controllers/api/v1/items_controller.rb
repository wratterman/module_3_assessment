class Api::V1::ItemsController < ApplicationController

  before_action :set_item, only: [:show, :destroy]

  def index
    render json: Item.all
  end

  def show
    render json: @item
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end
end
