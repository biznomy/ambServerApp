json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name
  json.url api_v1_admin_vendor_url(vendor, format: :json)
end
