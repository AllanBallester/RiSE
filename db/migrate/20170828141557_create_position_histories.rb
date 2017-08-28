class CreatePositionHistories < ActiveRecord::Migration[5.0]
  def change
    create_table :position_histories do |t|
      t.references :homeless, foreign_key: true
      t.float :latitude
      t.float :longitude
      t.string :location

      t.timestamps
    end
  end
end
