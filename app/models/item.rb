class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  delegate :address, to: :user, prefix: true
  geocoded_by :user_address
  # before_create :geocode, unless: :geocoded? # the instance method from geocoder
  before_create :copy_user_coordinates, unless: :geocoded?

  def photo_or_default
    photo.attached? ? photo.key : "default_item"
  end

  private

  def copy_user_coordinates
    self.latitude = user.latitude
    self.longitude = user.longitude
  end
end
