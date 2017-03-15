class AddAddonRefToBookingaddons < ActiveRecord::Migration
  def change
    add_reference :bookingaddons, :addon, index: true
  end
end
