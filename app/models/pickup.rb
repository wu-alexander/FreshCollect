class Pickup < ApplicationRecord
  belongs_to :item
  belongs_to :user
  enum status: { Pending: 0, Completed: 10 }

  validates :arrive_at, presence: true

  def relative_pickup_date
    case arrive_at.to_date - Date.current
    when 0 then "today"
    when 1 then "tomorrow"
    else
      arrive_at.strftime("%b %d")
    end
  end

  def completed!
    update_attribute :status, "Completed"
  end
end
