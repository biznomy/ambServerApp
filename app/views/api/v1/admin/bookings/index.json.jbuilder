json.array!(@bookings) do |booking|
 
  json.extract! booking, :id, :date, :fadd1, :fadd2, :fadd3, :tadd1, :tadd2 , :tadd3
  json.(booking.vendor, :name ) 
  json.url booking_url(booking, format: :json)
end
