json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :number
end
