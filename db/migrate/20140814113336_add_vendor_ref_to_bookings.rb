class AddVendorRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :vendor, index: true
  end
end
