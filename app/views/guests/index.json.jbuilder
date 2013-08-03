json.array!(@guests) do |guest|
  json.extract! guest, :name, :user_id, :username, :guest
  json.url guest_url(guest, format: :json)
end
