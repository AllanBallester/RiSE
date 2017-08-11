class AddRiserIdToReviews < ActiveRecord::Migration[5.0]
  def change
    add_reference :reviews, :riser, foreign_key: true
  end
end
