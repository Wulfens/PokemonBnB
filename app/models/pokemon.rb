class Pokemon < ApplicationRecord
  include PokemonConcern
  TYPES = %w[acier combat dragon eau electrik feu fee glace
             insecte normal plante poison psy roche sol spectre tenebres vol]

  belongs_to :user
  has_many :bookings
  has_one_attached :photo

  validates :name, :types, presence: true

  validates :price_per_day, numericality: { only_float: true }

  before_validation :shift_types
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  private

  def shift_types
    types.delete("")
  end
end
