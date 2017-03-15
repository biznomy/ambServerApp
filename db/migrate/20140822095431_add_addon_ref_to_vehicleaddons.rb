class AddAddonRefToVehicleaddons < ActiveRecord::Migration
  def change
    add_reference :vehicleaddons, :addon, index: true
  end
end
