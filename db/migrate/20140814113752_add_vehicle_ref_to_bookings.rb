class AddVehicleRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :vehicle, index: true
  end
end
