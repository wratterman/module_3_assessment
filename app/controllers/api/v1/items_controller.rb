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

  def create
    @item = Item.new(item_params)
    if @item.save
      render json: @item, :status=> :created
    else
      #error message
    end
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.permit(:name, :description, :image_url)
  end
end
