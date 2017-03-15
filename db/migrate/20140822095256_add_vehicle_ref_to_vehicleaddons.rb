class AddVehicleRefToVehicleaddons < ActiveRecord::Migration
  def change
    add_reference :vehicleaddons, :vehicle, index: true
  end
end
