json.code 0
json.bookings(@bookings.keys) do |booking|
  json.date booking
  
end
