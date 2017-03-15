class RemoveAddressidToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :address_id, :integer
  end
end
