class Homeless < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :intentions

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
