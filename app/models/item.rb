class Item < ApplicationRecord
  belongs_to :user
  has_many :pickups
  has_one :active_pickup, -> { where(status: [:pending, :completed]) }, class_name: "Pickup"
  has_one_attached :photo
  validates :photo, :title, :start_pickup_at, :end_pickup_at, presence: true

  delegate :address, to: :user, prefix: true
  delegate :status, to: :active_pickup, allow_nil: true, prefix: true
  geocoded_by :user_address
  # before_create :geocode, unless: :geocoded? # the instance method from geocoder
  before_create :copy_user_coordinates, unless: :geocoded?

  def photo_or_default
    photo.attached? ? photo.key : "default_item"
  end

  def status
    active_pickup_status || :Available
  end

  private

  def copy_user_coordinates
    self.latitude = user.latitude
    self.longitude = user.longitude
  end
end
