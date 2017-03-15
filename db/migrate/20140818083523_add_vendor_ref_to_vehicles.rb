class AddVendorRefToVehicles < ActiveRecord::Migration
  def change
    add_reference :vehicles, :vendor, index: true
  end
end
