class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.date :start_time    # attribute for simple calendar to represent a booking date
      t.string :name        # attribute for simple calendar to represent a booking time (am, pm, all)
      t.integer :price_cents
      t.references :vehicle, foreign_key: true
      t.references :charge_station, foreign_key: true

      t.timestamps
    end
  end
end
