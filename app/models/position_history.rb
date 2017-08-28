class PositionHistory < ApplicationRecord
  belongs_to :homeless

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
