json.array!(@profiles) do |profile|
  json.extract! profile, :id, :fname, :lname, :address, :contactno, :service, :description
  json.url profile_url(profile, format: :json)
end
