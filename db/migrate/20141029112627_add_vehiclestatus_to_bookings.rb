class AddVehiclestatusToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :vehiclestatus, :integer, :default => 0
  end
end
