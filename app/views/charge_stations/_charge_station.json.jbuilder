json.extract! charge_station, :id, :street_number, :street, :city, :postcode, :state, :charge_kwh, :adapter_id, :open_time, :close_time, :days_of_week, :price_kwh_cents, :user_id, :created_at, :updated_at
json.url charge_station_url(charge_station, format: :json)
