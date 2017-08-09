class CreateHomelesses < ActiveRecord::Migration[5.0]
  def change
    create_table :homelesses do |t|
      t.string :name
      t.text :story

      t.timestamps
    end
  end
end
