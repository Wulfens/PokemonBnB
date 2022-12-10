class Pokemon < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :price_per_day, numericality: { only_integer: true }
end
