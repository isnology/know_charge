json.extract! vehicle, :id, :licence_plate, :make, :model, :colour, :charger_kwh, :drivers_licence_number, :image_data, :user_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
