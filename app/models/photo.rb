class Photo < ApplicationRecord
  belongs_to :homeless
  belongs_to :review
  # belongs_to :riser
  mount_uploader :picture, PictureHomelessUploader
end
