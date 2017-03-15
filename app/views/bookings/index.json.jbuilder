json.array!(@bookings) do |booking|
  json.extract! booking, :id, :date, :f_add, :e_add
  json.url booking_url(booking, format: :json)
end
