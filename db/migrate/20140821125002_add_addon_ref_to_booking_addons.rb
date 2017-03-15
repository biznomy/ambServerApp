class AddAddonRefToBookingAddons < ActiveRecord::Migration
  def change
    add_reference :booking_addons, :addon, index: true
  end
end
