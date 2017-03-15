class AddFadd3ToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :fadd3, :string
  end
end
