class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :photo

  def photo_or_default
    photo.attached? ? photo.key : "default_item"
  end
end
