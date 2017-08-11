class AddColumsToHomelesses < ActiveRecord::Migration[5.0]
  def change
    add_column :homelesses, :last_name, :string
    add_column :homelesses, :phone, :string
    add_column :homelesses, :fb_account, :string
  end
end
