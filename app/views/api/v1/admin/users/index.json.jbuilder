json.array!(@users) do |user|
  json.extract! user, :id, :email
  json.url api_v1_admin_user_url(user, format: :json)
end
