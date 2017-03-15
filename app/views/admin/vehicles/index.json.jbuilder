json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :number
  json.url admin_vehicle_url(vehicle, format: :json)
end
