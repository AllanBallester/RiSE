class AddConfirmableToRisers < ActiveRecord::Migration[5.0]
  def change

    add_column :risers, :confirmation_token, :string
    add_column :risers, :confirmed_at, :datetime
    add_column :risers, :confirmation_sent_at, :datetime
    add_column :risers, :unconfirmed_email, :string
  end
end
