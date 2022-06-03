class ItemsController < ApplicationController
  before_action :set_item, only: [ :show, :edit, :update, :destroy ]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index
    @items = current_user&.geocoded? ? Item.near(current_user, 50) : Item.all
    @markers = @items.geocoded.map do |item|
      {
        lat: item.latitude,
        lng: item.longitude,
        info_window: render_to_string(partial: "info_window", locals: { item: item })
      }
    end
  end

  def show
    @pickup = Pickup.new
  end

  def new
    @item = Item.new
  end

  def user_address
    params.dig(:item, :user, :address)
  end

  def create
    current_user.update(address: user_address) if user_address.present?

    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      # users_near_item # create notifications for those
      users_near_item.each do |near_user|
        ItemNotification.with(item: @item).deliver_later(near_user)
      end
      redirect_to @item
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to @item
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to items_path
  end

  private

  def users_near_item
    User.near(@item, 5).where.not(id: @item.user)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:title, :description, :start_pickup_at, :end_pickup_at, :latitude, :longitude, :photo)
  end
end
