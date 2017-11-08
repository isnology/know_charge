json.extract! conversation, :id, :charge_station_id, :user_id, :created_at, :updated_at
json.url conversation_url(conversation, format: :json)
