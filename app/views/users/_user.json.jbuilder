json.extract! user, :id, :name, :email, :phone_number, :profile_photo, :created_at, :updated_at
json.url user_url(user, format: :json)
# json.profile_photo url_for(user.profile_photo)
