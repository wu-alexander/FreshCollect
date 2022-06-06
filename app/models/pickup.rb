class Pickup < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :arrive_at, presence: true
end
