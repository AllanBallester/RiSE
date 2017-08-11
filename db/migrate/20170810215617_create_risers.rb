class CreateRisers < ActiveRecord::Migration[5.0]
  def change
    create_table :risers do |t|
      t.string :name
      t.string :last_name

      t.timestamps
    end
  end
end
