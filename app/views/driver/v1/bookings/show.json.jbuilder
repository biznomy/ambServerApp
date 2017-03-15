json.code 0
json.bookings{
json.extract! @booking, :id, :date, :fadd1 ,:fadd2, :tadd1,:tadd2
json.vendor @booking.vendor.name
}