class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :pokemon

  scope :pending, -> { where(status: "pending") }
  scope :accepted, -> { where(status: "accepted") }
  scope :declined, -> { where(status: "declined") }
  scope :canceled, -> { where(status: "canceled") }

end
