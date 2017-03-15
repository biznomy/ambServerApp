class BookingPdf< Prawn::Document

  def initialize(booking)
    super()
    @booking = booking
    text "Id\##{@booking.id}"
    text "Address\##{@booking.tadd1}"
  end

end