class Pickup < ApplicationRecord
  belongs_to :item
  belongs_to :user
  enum status: { pending: 0, completed: 10 }

  validates :arrive_at, presence: true
end
