class CreatePayments < ActiveRecord::Migration[5.1]
  def change
    create_table :payments do |t|
      t.integer :price_cents
      t.string :charge_identifier
      t.references :booking, foreign_key: true

      t.timestamps
    end
  end
end
