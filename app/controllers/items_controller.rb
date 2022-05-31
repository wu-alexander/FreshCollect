class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]

  def index
  end

  def show
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to @item, notice: "Your item has been created"
    else
      render "new"
    end
  end

  def edit
  end

  def update
    @item.update(item_params)
    redirect_to @item, notice: "Your item has been updated"
  end

  def destroy
    @item.destroy
    redirect_to items_path, notice: "Your item has been deleted"
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :start_pickup_at, :end_pickup_at, :latitude, :longitude)
  end
end
