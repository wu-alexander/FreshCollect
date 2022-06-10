class User < ApplicationRecord
  has_many :items
  has_many :pickups
  has_many :sharer_pickups, through: :items, source: :pickups
  has_one_attached :photo
  has_many :notifications, as: :recipient

  geocoded_by :address

  before_create :geocode, unless: :geocoded?
  before_update :geocode, if: :address_changed?

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def photo_or_default
    photo.attached? ? photo.key : "default_avatar"
  end
end
