class CreateIntentions < ActiveRecord::Migration[5.0]
  def change
    create_table :intentions do |t|
      t.references :riser, foreign_key: true
      t.references :homeless, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
