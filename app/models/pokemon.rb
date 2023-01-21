class Pokemon < ApplicationRecord
  include PokemonConcern
  TYPES = %w[acier combat dragon eau électrik feu fée glace insecte normal plante poison psy roche sol spectre ténèbres vol]

  belongs_to :user
  has_many :bookings

  validates :name, :types, presence: true

  validates :price_per_day, numericality: { only_float: true }

  before_validation :shift_types

  private

  def shift_types
    types.shift
  end
end
