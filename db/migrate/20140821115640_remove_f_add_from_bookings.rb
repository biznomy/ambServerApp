class RemoveFAddFromBookings < ActiveRecord::Migration
  def change
    remove_column :bookings, :f_add, :string
  end
end
