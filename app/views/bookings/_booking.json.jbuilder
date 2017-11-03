json.extract! booking, :id, :date, :time, :duration, :price_cents, :vehicle_id, :charge_station_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
