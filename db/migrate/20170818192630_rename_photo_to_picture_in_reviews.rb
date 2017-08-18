class RenamePhotoToPictureInReviews < ActiveRecord::Migration[5.0]
  def change
    rename_column :reviews, :photo, :picture
  end
end
