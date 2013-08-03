json.array!(@keyholders) do |keyholder|
  json.extract! keyholder, :username, :first_name, :last_name, :user_id, :house, :postcode
  json.url keyholder_url(keyholder, format: :json)
end
