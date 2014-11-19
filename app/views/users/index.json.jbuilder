json.array!(@users) do |user|
  json.extract! user, :id, :first_name, :last_name, :email, :password, :client_registration_id
  json.url user_url(user, format: :json)
end
