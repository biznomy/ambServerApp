class AddVendorRefToDrivers < ActiveRecord::Migration
  def change
    add_reference :drivers, :vendor, index: true
  end
end
