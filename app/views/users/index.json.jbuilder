json.array!(@users) do |user|
  json.extract! user, :id, :firstName, :lastName, :email, :password, :phoneNumber, :clientRegistrationId
  json.url user_url(user, format: :json)
end
