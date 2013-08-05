json.array!(@funerals) do |funeral|
  json.extract! funeral, :funeral_pref, :casket_pref, :other_pref, :service_location, :burial_location, :ashes_location, :songs_pref, :readings, :speakers, :final_words, :dress_code, :flowers, :donations_to, :wake, :epitaph, :additional_reqs, :user_id
  json.url funeral_url(funeral, format: :json)
end
