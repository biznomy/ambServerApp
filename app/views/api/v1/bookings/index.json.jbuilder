json.code 0
json.bookings(@bookings) do |booking|
  json.id booking.id
  json.date booking.date
  json.user booking.user.userprofile.full_name
  json.vendor booking.vendor.name
  json.fadd1 booking.fadd1
  json.fadd2 booking.fadd2
  json.tadd1 booking.tadd1
  json.tadd2 booking.tadd2
end
