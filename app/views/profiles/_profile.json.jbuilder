json.extract! profile, :id, :first_name, :last_name, :street_number, :street, :city, :state, :image_data, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
