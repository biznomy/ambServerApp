class AddTadd1ToBookings < ActiveRecord::Migration
  def change
    add_column :bookings, :tadd1, :string
    add_column :bookings, :tadd2, :string
    add_column :bookings, :tadd3, :string
  end
end
