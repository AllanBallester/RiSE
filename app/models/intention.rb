class Intention < ApplicationRecord
  OPTIONS=["food", "good", "skills", "hospitality", "others"]
  belongs_to :riser
  belongs_to :homeless

  validates :content, presence: true
end
