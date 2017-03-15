class AddBookingRefToBookingaddons < ActiveRecord::Migration
  def change
    add_reference :bookingaddons, :booking, index: true
  end
end
