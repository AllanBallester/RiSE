class AddLocationToHomelesses < ActiveRecord::Migration[5.0]
  def change
    add_column :homelesses, :location, :string
  end
end
