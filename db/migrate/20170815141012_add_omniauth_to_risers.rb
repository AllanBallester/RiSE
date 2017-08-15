class AddOmniauthToRisers < ActiveRecord::Migration[5.0]
  def change
    add_column :risers, :provider, :string
    add_column :risers, :uid, :string
    add_column :risers, :facebook_picture_url, :string
    add_column :risers, :first_name, :string
    add_column :risers, :token, :string
    add_column :risers, :token_expiry, :datetime
  end
end
