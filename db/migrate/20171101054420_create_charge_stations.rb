class CreateChargeStations < ActiveRecord::Migration[5.1]
  def change
    create_table :charge_stations do |t|
      t.string :street_number
      t.string :street
      t.string :city
      t.string :postcode
      t.string :state
      t.float :charge_kwh
      t.references :adapter, foreign_key: true
      t.time :open_time
      t.time :close_time
      t.string :days_of_week
      t.integer :price_kwh_cents
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
