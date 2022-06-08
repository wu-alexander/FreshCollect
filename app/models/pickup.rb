class Pickup < ApplicationRecord
  belongs_to :item
  belongs_to :user
  enum status: { Pending: 0, Completed: 10 }

  validates :arrive_at, presence: true
end
