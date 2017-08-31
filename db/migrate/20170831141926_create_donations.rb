class CreateDonations < ActiveRecord::Migration[5.0]
  def change
    create_table :donations do |t|
      t.string :state
      t.monetize :amount, currency: { present: false }
      t.json :payment

      t.timestamps
    end
  end
end
