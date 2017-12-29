class AddSkillsToHomelesses < ActiveRecord::Migration[5.0]
  def change
    add_column :homelesses, :skills, :string
  end
end
