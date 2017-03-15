json.array!(@addons) do |addon|
  json.extract! addon, :id, :name
  json.url api_v1_admin_addon_url(addon, format: :json)
end
