class Homeless < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :photos, dependent: :destroy
  has_many :intentions

  validates :name, presence: true
  validates :last_name, presence: true
  validates :location, presence: true
  validates_uniqueness_of :name, :scope => [:last_name]

  geocoded_by :location
  after_validation :geocode, if: :location_changed?
end
