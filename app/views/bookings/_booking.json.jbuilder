json.extract! booking, :id, :start_time, :name, :price_cents, :vehicle_id, :charge_station_id, :created_at, :updated_at
json.url booking_url(booking, format: :json)
