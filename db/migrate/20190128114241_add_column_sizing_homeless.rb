class AddColumnSizingHomeless < ActiveRecord::Migration[5.0]
  def change
    add_column :homelesses, :shoe_size, :integer
    add_column :homelesses, :top_size, :string
    add_column :homelesses, :bottom_size, :string
  end
end
