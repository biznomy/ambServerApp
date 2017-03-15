class RemoveEaddToBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :e_add, :string
  end
end
