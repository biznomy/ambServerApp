class AddFAddToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :f_add, :string
  end
end
