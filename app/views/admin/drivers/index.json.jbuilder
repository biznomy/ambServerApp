json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name
  json.url driver_url(driver, format: :json)
end
