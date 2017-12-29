class Intention < ApplicationRecord
  OPTIONS=["food", "good", "jobs", "hospitality", "others"]
  belongs_to :riser
  belongs_to :homeless

  validates :content, presence: true
end
