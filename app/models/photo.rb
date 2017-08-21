class Photo < ApplicationRecord
  belongs_to :homeless
  # belongs_to :riser
  mount_uploader :picture, PictureHomelessUploader

  validates :picture, presence: true
end
