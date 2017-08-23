class AddRiserToHomelesses < ActiveRecord::Migration[5.0]
  def change
    add_reference :homelesses, :riser, foreign_key: true
  end
end
