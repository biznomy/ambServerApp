class AddAddressRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :address, index: true
  end
end
