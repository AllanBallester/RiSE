class Intention < ApplicationRecord
  OPTIONS=["Food", "Good", "Skills", "Hospitality", "Others"]
  belongs_to :riser
  belongs_to :homeless

  validates :content, presence: true
end
