json.array!(@userprofiles) do |userprofile|
  json.extract! userprofile, :id, :full_name, :medical_info, :address
  json.url userprofile_url(userprofile, format: :json)
end
