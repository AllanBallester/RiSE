class Review < ApplicationRecord
  belongs_to :homeless
  belongs_to :riser

  validates :content, presence: true

  mount_uploader :picture, PictureHomelessUploader
end
