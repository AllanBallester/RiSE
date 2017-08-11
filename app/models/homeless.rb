class Homeless < ApplicationRecord
  has_many :reviews
  has_many :photos
end
