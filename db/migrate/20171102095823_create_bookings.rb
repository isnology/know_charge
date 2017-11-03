class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :date
      t.time :time
      t.integer :duration
      t.integer :price_cents
      t.references :vehicle, foreign_key: true
      t.references :charge_station, foreign_key: true

      t.timestamps
    end
  end
end
