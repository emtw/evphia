json.array!(@users) do |user|
  json.extract! user, :first_name, :middle_names, :last_name, :date_of_birth, :gender, :line_1, :line_2, :line_3, :town, :county, :postcode, :contact_number, :username, :keyholder_id, :guest_id
  json.url user_url(user, format: :json)
end
