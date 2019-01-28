class ModifyColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :homelesses, :name, :nickname
  end
end
