json.code 0
json.users(@users) do |detail|
  json.id detail.userprofile.id
  json.full_name detail.userprofile.full_name
  json.address detail.userprofile.address
end
