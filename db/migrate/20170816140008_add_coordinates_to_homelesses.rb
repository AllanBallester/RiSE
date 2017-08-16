class AddCoordinatesToHomelesses < ActiveRecord::Migration[5.0]
  def change
    add_column :homelesses, :latitude, :float
    add_column :homelesses, :longitude, :float
  end
end
