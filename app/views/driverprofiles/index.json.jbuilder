json.array!(@driverprofiles) do |driverprofile|
  json.extract! driverprofile, :id, :name
  json.url driverprofile_url(driverprofile, format: :json)
end
