class AddStatusToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :status, :integer, :default => 1
  end
end
