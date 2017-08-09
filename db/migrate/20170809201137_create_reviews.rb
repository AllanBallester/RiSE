class CreateReviews < ActiveRecord::Migration[5.0]
  def change
    create_table :reviews do |t|
      t.references :homeless, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
