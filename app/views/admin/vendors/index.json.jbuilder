json.array!(@vendors) do |vendor|
  json.extract! vendor, :id, :name
  json.url admin_vendor_url(vendor, format: :json)
end
