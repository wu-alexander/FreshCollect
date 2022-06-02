class PickupsController < ApplicationController
  def show
    @pickup = Pickup.find(params[:id])
  end

  def new
    @item = Item.find(params[:item_id])
    @item_host = @item.user
    @pickup = Pickup.new
  end

  def create
    @item = Item.find(params[:item_id])
    @pickup = Pickup.new(pickup_params)
    @pickup.item = Item.find(params[:item_id])
    @pickup.user = current_user
    if @pickup.save
      PickupNotification.with(pickup: @pickup).deliver_later(@item.user)

      redirect_to pickup_path(@pickup)
    else
      render "item/show"
    end
  end

  private

  def pickup_params
    params.require(:pickup).permit(:arrive_at, :photo)
  end
end
