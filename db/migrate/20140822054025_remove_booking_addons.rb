class RemoveBookingAddons < ActiveRecord::Migration
  def change
  	drop_table :booking_addons
  end
end
