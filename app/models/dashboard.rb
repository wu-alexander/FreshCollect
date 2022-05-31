class Dashboard < ApplicationRecord
  def initialize(user)
    @user = user
  end

  def collector_pickups
    @user.pickups
  end

  def sharer_items
    @user.items
  end

  def sharer_pickups
    @user.sharer_pickups
  end
end
