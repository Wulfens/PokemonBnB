class Pokemon < ApplicationRecord
  TYPES = %w[acier combat dragon eau électrik feu fée glace insecte normal plante poison psy roche sol spectre ténèbres vol]

  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :price_per_day, numericality: { only_integer: true }

  before_validation :shift_types

  private

  def shift_types
    types.first == "" ? types.shift : types
  end
end
