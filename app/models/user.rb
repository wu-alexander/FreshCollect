class User < ApplicationRecord
  has_many :items
  has_many :pickups
  has_many :sharer_pickups, through: :items, source: :pickups

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
