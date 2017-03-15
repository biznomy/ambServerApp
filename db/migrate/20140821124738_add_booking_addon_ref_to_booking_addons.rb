class AddBookingAddonRefToBookingAddons < ActiveRecord::Migration
  def change
    add_reference :booking_addons, :booking, index: true
  end
end
