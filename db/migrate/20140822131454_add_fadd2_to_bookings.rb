class AddFadd2ToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :fadd2, :string
  end
end
