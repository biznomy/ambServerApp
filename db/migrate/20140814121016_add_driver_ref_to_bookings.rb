class AddDriverRefToBookings < ActiveRecord::Migration
  def change
    add_reference :bookings, :driver, index: true
  end
end
